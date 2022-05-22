import 'package:doanchuyennganh/Models/Banner.dart';
import 'package:doanchuyennganh/widgets/webview_navigating.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SectionInfo(text: "Medical Information", press: () {
        }),
        GridView.builder(
          shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: banner_raw.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ), itemBuilder: (BuildContext context,int index){
          return Card(image: banner_raw[index].image,
              press: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => WebViewNavigating()
                    ),
                        (Route<dynamic> route) => false
                );
              }, size: size);
        })
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.image,
    required this.press,
    required this.size,
  }) : super(key: key);
  final String image;
  final Size size;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 20,right: 10),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(image,
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover),
              ],),
          ),
        ),
      ),
    );
  }
}

