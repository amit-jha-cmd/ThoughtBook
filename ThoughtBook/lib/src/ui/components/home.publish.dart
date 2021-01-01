import 'package:ThoughtBook/src/ui/components/home.smAd.dart';
import 'package:flutter/material.dart';

class Publish extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void clearTextField() {
      FocusScope.of(context).requestFocus(new FocusNode());
      controller.clear();
    }

    return Container(
      padding: EdgeInsets.all(10),
      height: 240,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 2.0,
                color: Color.fromRGBO(0, 0, 0, 0.5),
                spreadRadius: 0.0),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "5 entries remaining for the day",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              // height: 5 * 24.0,
              child: TextField(
                maxLines: 3,
                minLines: 1,
                maxLength: 144,
                controller: this.controller,
                decoration: InputDecoration(
                  hintText: "Type your entry here",
                  // fillColor: Colors.grey[300],
                  // filled: true,
                ),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: clearTextField,
                color: Colors.blueAccent,
                splashColor: Colors.blue,
                child: Text(
                  "Publish",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
