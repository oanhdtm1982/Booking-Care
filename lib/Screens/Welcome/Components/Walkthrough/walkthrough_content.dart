import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.image1,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String image1, text1, text2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Spacer(),
          Container(
            height: 240,
            child: Image.asset(
              "$image1",
              width: size.width * .8,
            ),
          ),
          SizedBox(height: 40),
          Text(
            "$text1",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(12, 0),
                    blurRadius: 25.0,
                    color: Colors.black26,
                  ),
                ]),
          ),
          SizedBox(height: 9),
          Text(
            "$text2",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(100, 49, 49, 49),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}