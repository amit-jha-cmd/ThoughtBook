import 'package:ThoughtBook/src/ui/components/home.drawer.dart';
import 'package:ThoughtBook/src/ui/components/home.entryCard.dart';
import 'package:ThoughtBook/src/ui/components/home.publish.dart';
import 'package:flutter/material.dart';

class PageLogin extends StatelessWidget {
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: HomeDrawer(),
      backgroundColor: Color.fromRGBO(155, 167, 193, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 6, 19, 1),
        // centerTitle: true,
        title: Text(
          "Thought Book",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: FlatButton(
                  onPressed: null,
                  child: Text(
                    "Go Pro",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        width: this.width,
        height: this.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(
                10,
              ),
              child: Row(children: <Widget>[
                Text(
                  "January 1st, 2020  ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Divider(
                  thickness: 2.0,
                  color: Color.fromRGBO(117, 130, 158, 1),
                )),
              ]),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  EntryCard(),
                  EntryCard(),
                ],
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Publish()
          ],
        ),
      ),
    );
  }
}
