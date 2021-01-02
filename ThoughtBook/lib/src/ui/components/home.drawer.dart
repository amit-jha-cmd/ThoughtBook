import 'package:ThoughtBook/src/model/session.dart';
import 'package:ThoughtBook/src/ui/page/page.aboutme.dart';
import 'package:ThoughtBook/src/ui/page/page.history.dart';
import 'package:ThoughtBook/src/ui/page/page.login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget {
  final session = activeSession;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,

        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(1, 10, 30, 1),
            ),
            accountName: Text(session.username.toString()),
            accountEmail: Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                session.username.toString()[0].toUpperCase(),
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("History"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageHistory(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () {
              _save(false, "", "", "", "");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PageLogin(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About Me"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageAboutMe()));
            },
          ),
        ],
      ),
    );
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

    print('saved $loggedInValue');
  }
}
