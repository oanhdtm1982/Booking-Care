import 'package:flutter/material.dart';

class SectionInfo extends StatelessWidget {
  const SectionInfo({Key? key,
    required this.text,
    required this.press}) : super(key: key);
  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(
              fontSize: 18,
              color: Colors.black
          ),),
          GestureDetector(
            onTap: press,
            child: Text("See More"),
          )
        ],
      ),
    );
  }
}



