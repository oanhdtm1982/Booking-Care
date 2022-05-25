import 'package:flutter/material.dart';

class CardBanner extends StatelessWidget {
  const CardBanner({
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
                Image.network(image,width: size.width,height: size.height,fit: BoxFit.cover)
              ],),
          ),
        ),
      ),
    );
  }
}
