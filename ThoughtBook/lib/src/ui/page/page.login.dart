import 'package:ThoughtBook/src/model/session.dart';
import 'package:ThoughtBook/src/ui/components/firebase.auth.dart';
import 'package:ThoughtBook/src/ui/page/page.home.dart';
import 'package:ThoughtBook/src/ui/page/page.intro.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Thought Book",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      singinTwitter().then((value) {
                        if (value != null) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PageHome();
                          }));
                        }
                      });
                    },
                    child: Icon(
                      EvaIcons.twitter,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  FlatButton(
                    onPressed: () {
                      signInWithGoogle().then((value) {
                        if (value != null) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return PageHome();
                          }));
                        }
                      });
                    },
                    child: Icon(
                      EvaIcons.google,
                      size: 100,
                    ),
                  ),
                ],
              ),

              // RawMaterialButton(
              //   onPressed: () => null,
              //   elevation: 2.0,
              //   fillColor: Colors.white,
              //   child: Icon(
              //     Icons.arrow_forward,
              //     size: 55.0,
              //   ),
              //   padding: EdgeInsets.all(15.0),
              //   shape: CircleBorder(),
              // ),
              SizedBox(
                height: 5,
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
