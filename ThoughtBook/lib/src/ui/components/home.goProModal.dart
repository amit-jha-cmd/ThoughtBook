import 'package:flutter/material.dart';

class HomeGoProModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Why You Should Go Pro",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 21,
              fontWeight: FontWeight.w300,
            ),
          ),
          Divider(),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 40,
              ),
              title: Text(
                "Unlimited Entries Per Day",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 40,
              ),
              title: Text(
                "Easy Access To New Features",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 40,
              ),
              title: Text(
                "It's Super Affordable",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () => print("subscription"),
            child: Text("Continue"),
          )
        ],
      ),
    );
  }
}
