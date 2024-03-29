import 'package:flutter/material.dart';

class PageAboutMe extends StatelessWidget {
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
            "About Me",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          actions: []),
      body: Container(
        width: this.width,
        height: this.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.computer,
              size: 70,
            ),
            Text("I'm a full-stack developer based in India"),
            Text("I also work as a freelancer"),
            Text("Contact: _email_")
          ],
        ),
      ),
    );
  }
}
