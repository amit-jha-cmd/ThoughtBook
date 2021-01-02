import 'package:ThoughtBook/src/model/session.dart';
import 'package:ThoughtBook/src/ui/page/page.home.dart';
import 'package:ThoughtBook/src/ui/page/page.intro.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  void _singinTwitter() async {
    var twitterLogin = new TwitterLogin(
      consumerKey: 'OixYnsjNPGZaFdQif141aBzxI',
      consumerSecret: 'cZBlewtbukn9zjx2KppFuMnJT7ucM8F14ggZEWaNFCwkXj9z54',
    );

    final TwitterLoginResult result = await twitterLogin.authorize();

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        var session = result.session;
        activeSession.setLogin = true;
        activeSession.setKey = session.secret;
        activeSession.setToken = session.token;
        activeSession.setUsername = session.username;
        _save(
          true,
          session.token,
          session.secret,
          session.username,
          session.userId,
        ).then((status) => {
              if (status == true)
                {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageHome(session),
                    ),
                  )
                }
            });
        // _sendTokenAndSecretToServer(session.token, session.secret);
        break;
      case TwitterLoginStatus.cancelledByUser:
        // _s(howCancelMessage();
        print("cancelled by user");
        break;
      case TwitterLoginStatus.error:
        // _showErrorMessage(result.error);
        print(result.errorMessage);
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _read().then((session) => {
          if (session["loggedIn"])
            {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PageHome(session),
                ),
              )
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                EvaIcons.twitter,
                size: 150,
              ),
              RawMaterialButton(
                // onPressed: () => Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PageHome(),
                //   ),
                // ),

                onPressed: () => _singinTwitter(),
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward,
                  size: 55.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return PageIntro();
                        });
                  },
                  child: Text(
                    "how it works",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(220, 220, 220, 1)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = 'loggedIn';
    final token = 'token';
    final key = 'key';
    final username = 'username';
    final userId = 'userId';

    final loggedInValue = prefs.getBool(loggedIn) ?? false;
    final tokenValue = prefs.getString(token) ?? "";
    final keyValue = prefs.getString(key) ?? "";
    final usernameValue = prefs.getString(username) ?? "";
    final userIdValue = prefs.getString(userId) ?? "";

    final session = {
      loggedIn: loggedInValue,
      token: tokenValue,
      key: keyValue,
      username: usernameValue,
      userId: userIdValue
    };

    // print('read: $session');
    return session;
  }

  _save(bool loggedInValue, String tokenValue, String keyValue,
      String usernameValue, String userIdValue) async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = 'loggedIn';
    final token = 'token';
    final key = 'key';
    final username = 'username';
    final userId = 'userId';

    prefs.setBool(loggedIn, loggedInValue);
    prefs.setString(token, tokenValue);
    prefs.setString(key, keyValue);
    prefs.setString(username, usernameValue);
    prefs.setString(userId, userIdValue);

    _read().then(
      (session) => {
        print(
          session,
        ),
      },
    );

    return true;
  }
}
