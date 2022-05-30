import 'package:flutter/material.dart';

import '../Screens/prefixIcon.dart';


class BirthDay extends StatefulWidget {
  BirthDay({
    required this.birthday,
    this.leftPos = 15.0,
    this.title = "Birthday",
    Key? key}) : super(key: key);
  DateTime birthday;
  final double leftPos;
  final String title;
  @override
  State<BirthDay> createState() => _BirthDayState();
}

class _BirthDayState extends State<BirthDay> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.birthday,
        firstDate: DateTime(1950, 3, 5),
        lastDate: DateTime(
            DateTime.now().year,
            DateTime.now().month+1,
            DateTime.now().day));
    if (picked != null && picked != widget.birthday)
      setState(() {
        widget.birthday = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      PrefixIcon(iconData: Icons.date_range),
      GestureDetector(
        child: Padding(
          padding: EdgeInsets.only(left: widget.leftPos),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                      color: Colors.grey)),
              SizedBox(height: 1),
              Text('${widget.birthday.toLocal()}'.split(' ')[0]),
            ],
          ),
        ),

        onTap: () => _selectDate(context),
      )
    ]);
  }

}