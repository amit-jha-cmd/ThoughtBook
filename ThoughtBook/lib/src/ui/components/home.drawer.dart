import 'package:ThoughtBook/src/ui/page/page.aboutme.dart';
import 'package:ThoughtBook/src/ui/page/page.history.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
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
            accountName: Text("Amit Jha"),
            accountEmail: Text("Twitter: @xyz"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "A",
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
              Navigator.pop(context);
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
}
