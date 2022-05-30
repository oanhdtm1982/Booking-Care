import 'package:flutter/material.dart';

import '../Screens/prefixIcon.dart';

class BuildForm extends StatelessWidget {
  const BuildForm({
    required this.title,
    required this.text,
    required this.icondata,
    this.leftPos = 0,
    required this.controller,
    Key? key}) : super(key: key);
  final String title;
  final String text;
  final IconData icondata;
  final double leftPos;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: (value) => controller.text = value!,
      decoration: InputDecoration(
        labelText:title,
        labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: Colors.grey
        ),
        hintText: text,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
        EdgeInsets.only(left: leftPos, bottom: 11, top: 11, right: 15),
        icon: PrefixIcon(iconData: icondata),
      ),
    );
  }
}
