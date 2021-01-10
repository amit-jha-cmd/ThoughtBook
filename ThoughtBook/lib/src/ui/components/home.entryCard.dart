import 'package:flutter/material.dart';
import 'package:share/share.dart';

class EntryCard extends StatelessWidget {
  EntryCard(this.date, this.entry);

  DateTime date;
  String entry;

  @override
  Widget build(BuildContext context) {
    String shareText =
        "Hey, I'm using Thought Book for my journal and here is an entry I want to share with you: $entry";
    String shareSubject = "Journal entry";
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                date.hour.toString().padLeft(2, '0') +
                    ":" +
                    date.minute.toString().padLeft(2, '0'),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(entry),
              onTap: () {
                final RenderBox box = context.findRenderObject();
                Share.share(shareText,
                    subject: shareSubject,
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
              },
              onLongPress: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 130,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Are you sure?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RaisedButton(
                              onPressed: null,
                              child: Text("Delete"),
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     TextButton(
            //       child: const Text('SHARE'),
            //       onPressed: () {/* ... */},
            //     ),
            //     const SizedBox(width: 8),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
