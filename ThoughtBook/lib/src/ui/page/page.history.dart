import 'package:ThoughtBook/src/bloc/api.bloc.dart';
import 'package:ThoughtBook/src/model/data.model.dart';
import 'package:ThoughtBook/src/ui/components/history.calender.dart';
import 'package:ThoughtBook/src/ui/components/home.entryCard.dart';
import 'package:ThoughtBook/src/ui/components/persistent.data.dart';
import 'package:flutter/material.dart';

class PageHistory extends StatefulWidget {
  @override
  _PageHistoryState createState() => _PageHistoryState();
}

class _PageHistoryState extends State<PageHistory> {
  double width;
  double height;

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    read().then((value) {
      bloc.fetchHistory(
        selectedDate,
        value['username'],
        value['provider'].split(".")[0],
      );
    });

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
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: []),
      body: Container(
        width: this.width,
        height: this.height,
        child: Column(
          children: [
            HistoryCalender(
              onChange: (date) => this.setState(() => this.selectedDate = date),
              currentDate2: selectedDate,
            ),
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
                onPressed: () => read().then((value) {
                  bloc.fetchHistory(
                    selectedDate,
                    value['username'],
                    value['provider'].split(".")[0],
                  );
                }),
                child: Text("View"),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: bloc.getHistory,
                builder:
                    (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
                  if (snapshot.hasData) {
                    return buildList(snapshot);
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Server Error"),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<DataModel> snapshot) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return EntryCard(
          snapshot.data.data[index].timestamp, snapshot.data.data[index].entry);
    });
  }
}
