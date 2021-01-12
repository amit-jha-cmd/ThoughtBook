import 'package:ThoughtBook/src/ui/components/persistent.data.dart';
import 'package:ThoughtBook/src/ui/page/page.aboutme.dart';
import 'package:ThoughtBook/src/ui/page/page.history.dart';
import 'package:ThoughtBook/src/ui/page/page.login.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
        future: read(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> childern;

          if (snapshot.hasData) {
            print(snapshot.data['imageURL']);
            childern = <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(1, 10, 30, 1),
                ),
                accountName: Text(
                  snapshot.data['name'] +
                      " | " +
                      snapshot.data['provider']
                          .toString()
                          .toUpperCase()
                          .split(".")[0],
                ),
                accountEmail: Text(""),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromRGBO(1, 10, 30, 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: snapshot.data['imageURL'] == ""
                        ? Text(
                            snapshot.data['name'][0].toUpperCase(),
                            style: TextStyle(fontSize: 40.0),
                          )
                        : Image.network(snapshot.data['imageURL']),
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
                  save(
                    false,
                    null,
                    null,
                    null,
                    null,
                    null,
                  );
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
            ];
          } else {
            childern = <Widget>[
              Center(
                child: Text("Please Login Again"),
              ),
            ];
          }

          return ListView(
            padding: EdgeInsets.zero,
            children: childern,
          );
        },
      ),
    );
  }
}
