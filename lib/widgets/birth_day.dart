import 'package:flutter/material.dart';

import '../Screens/prefixIcon.dart';


class BirthDay extends StatefulWidget {
  BirthDay({
    required this.birthday,
    Key? key}) : super(key: key);
  DateTime birthday;

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
            DateTime.now().month,
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
          padding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Birth date',
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