import 'package:flutter/material.dart';

class TimeSwitch extends StatefulWidget {
  @override
  _TimeSwitchState createState() => _TimeSwitchState();
}

class _TimeSwitchState extends State<TimeSwitch> {
  bool is24 = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        isThreeLine: true,
        leading: Icon(
          Icons.watch,
          size: 50,
        ),
        title: Text("24 hr clock"),
        subtitle: Text("View time on the journal entries in 24 hr time format"),
        trailing: Switch(
          value: is24,
          onChanged: (value) {
            setState(() {
              is24 = value;
              print(is24);
            });
          },
          activeColor: Color.fromRGBO(1, 6, 19, 1),
        ),
      ),
    );
  }
}
