import 'package:ThoughtBook/src/bloc/api.bloc.dart';
import 'package:ThoughtBook/src/model/data.model.dart';
import 'package:ThoughtBook/src/ui/components/home.drawer.dart';
import 'package:ThoughtBook/src/ui/components/home.entryCard.dart';
import 'package:ThoughtBook/src/ui/components/home.goProModal.dart';
import 'package:ThoughtBook/src/ui/components/home.publish.dart';
import 'package:ThoughtBook/src/ui/page/page.settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  double width;
  double height;
  bool goProPanel = false;
  CollectionReference metadata = Firestore.instance.collection("journal");

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    bloc.fetchTodaysEntry();
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
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return HomeGoProModal();
                        });
                  },
                  child: Text(
                    "Go Pro",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageSettings(),
                  ),
                ),
              ))
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
                child: StreamBuilder(
                  stream: bloc.getTodaysEntry,
                  builder: (BuildContext context,
                      AsyncSnapshot<DataModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text("No entries today"),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Something went wrong"),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return EntryCard(
                            (snapshot.data.data[index].timestamp as Timestamp)
                                .toDate(),
                            snapshot.data.data[index].entry,
                          );
                        },
                      );
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Publish(),
          ],
        ),
      ),
    );
  }
}
