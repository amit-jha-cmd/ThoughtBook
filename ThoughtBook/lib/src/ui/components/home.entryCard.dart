import 'package:flutter/material.dart';
import 'package:share/share.dart';

class EntryCard extends StatelessWidget {
  String shareText =
      "Hey, I'm using Thought Book for my journal and here is an entry I want to share with you: ";
  String shareSubject = "Journal entry";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                '2:00 AM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'There are a number of features that make RandomText a little different from other Lorem Ipsum dummy text generators you may find around the web',
              ),
              onTap: () {
                final RenderBox box = context.findRenderObject();
                Share.share(this.shareText,
                    subject: this.shareSubject,
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
