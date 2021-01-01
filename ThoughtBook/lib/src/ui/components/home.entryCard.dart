import 'package:flutter/material.dart';

class EntryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                '2:00 AM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'There are a number of features that make RandomText a little different from other Lorem Ipsum dummy text generators you may find around the web',
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     TextButton(
            //       child: const Text('DELETE'),
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
