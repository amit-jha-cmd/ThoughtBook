import 'package:ThoughtBook/src/model/session.dart';
import 'package:ThoughtBook/src/ui/components/firebase.auth.dart';
import 'package:ThoughtBook/src/ui/components/persistent.data.dart';
import 'package:ThoughtBook/src/ui/page/page.home.dart';
import 'package:ThoughtBook/src/ui/page/page.intro.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  // @override
  // void initState() {
  //   read().then((value) {
  //     if (value.loggedIn == true) {
  //       Navigator.of(context)
  //           .pushReplacement(MaterialPageRoute(builder: (context) {
  //         return PageHome();
  //       }));
  //     }
  //   });
  // }

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
                          value.getIdToken().then((token) {
                            save(
                              true,
                              token.token,
                              value.photoUrl,
                              value.displayName,
                              token.signInProvider,
                            ).then((value) {
                              if (value == true) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return PageHome();
                                }));
                              } else {
                                print("something went wrong");
                              }
                            });
                          });
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
                          value.getIdToken().then((token) {
                            save(
                              true,
                              token.token,
                              value.displayName,
                              value.photoUrl,
                              token.signInProvider,
                            ).then((value) {
                              if (value == true) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return PageHome();
                                }));
                              } else {
                                print("Trouble loggin in");
                              }
                            });
                          });
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
}
