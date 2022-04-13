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

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionInfo(text: "Medical Information", press: () {
        }),
        SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Card(
                  image: "assets/images/banner.png",
                  press: () {

                  }),
              Card(
                  image: "assets/images/banner.png",
                  press: () {

                  }),
              SizedBox(width: 20,)
            ],
          ),
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.image,
    required this.press}) : super(key: key);
  final String image;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 250,
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(image,
                fit: BoxFit.cover,),
            ],),
        ),
      ),
    );
  }
}

