import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text("Calendar"),),
      body: GridView.count(crossAxisCount: 3,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey
            ),
          )
        ],)
    );
  }
}