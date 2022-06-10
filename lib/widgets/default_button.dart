import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget{
  const DefaultButton({
    Key ? key,
    required this.text,
    this.customWidth = 293,
    this.customHeight = 50,
    this.backgroundcolor = Colors.blue,
    this.color = Colors.black,
}): super(key : key);
  final String text;
  final double customWidth;
  final double customHeight;
  final Color backgroundcolor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: customHeight,
      width: customWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: backgroundcolor,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}