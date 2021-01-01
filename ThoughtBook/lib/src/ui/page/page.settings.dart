import 'package:ThoughtBook/src/ui/components/settings.timeSwitch.dart';
import 'package:flutter/material.dart';

class PageSettings extends StatelessWidget {
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(155, 167, 193, 1),
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Color.fromRGBO(1, 6, 19, 1),
          // centerTitle: true,
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          actions: []),
      body: Container(
        width: this.width,
        height: this.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TimeSwitch(),
            Divider(),
          ],
        ),
      ),
    );
  }
}
