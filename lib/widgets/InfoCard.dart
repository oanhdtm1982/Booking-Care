import 'package:doanchuyennganh/widgets/webview_navigating.dart';
import 'package:flutter/material.dart';

import '../Models/Banner.dart';
import '../Screens/Welcome/Components/Home/SectionInfo_home.dart';
import 'Card.dart';


class InfoCard extends StatelessWidget {
  InfoCard({
    required this.index_Card,
    required this.isCheck,
    required this.list_banner,
    Key? key}) : super(key: key);
  List<Banner_Model> list_banner;
  int index_Card;
  bool isCheck;

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
            itemCount: list_banner.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ), itemBuilder: (BuildContext context,int index){
              index_Card = index;
              isCheck = !isCheck;
          return CardBanner(image: list_banner[index].image,
              press: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => WebViewNavigating(path:list_banner[index].path)
                    ),
                        (Route<dynamic> route) => false
                );
              }, size: size);
        })
      ],
    );
  }
}
