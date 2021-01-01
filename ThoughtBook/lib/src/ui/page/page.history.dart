import 'package:ThoughtBook/src/ui/components/history.calender.dart';
import 'package:ThoughtBook/src/ui/components/home.entryCard.dart';
import 'package:flutter/material.dart';

class PageHistory extends StatelessWidget {
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Color.fromRGBO(1, 6, 19, 1),
          // centerTitle: true,
          title: Text(
            "History",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          actions: []),
      body: Container(
        width: this.width,
        height: this.height,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  HistoryCalender(),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      "Select a date and click view to load the entires",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () => print("Load enteries"),
                      child: Text("View"),
                    ),
                  ),
                  EntryCard(),
                  EntryCard(),
                  EntryCard(),
                  EntryCard(),
                  EntryCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
