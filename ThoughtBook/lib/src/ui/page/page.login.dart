import 'package:ThoughtBook/src/ui/page/page.home.dart';
import 'package:ThoughtBook/src/ui/page/page.intro.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

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
              Icon(
                EvaIcons.twitter,
                size: 150,
              ),
              RawMaterialButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageHome(),
                  ),
                ),
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
}
