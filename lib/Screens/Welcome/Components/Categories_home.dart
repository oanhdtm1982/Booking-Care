import 'package:flutter/material.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/images/datlich.png", "text":"Register"},
      {"icon": "assets/images/lichsu.png", "text":"History"},
      {"icon": "assets/images/hoso.png", "text":"Profile"},
      {"icon": "assets/images/xemthem.png", "text":"See More"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(categories.length, (index) => CategoryCard(icon: categories[index]["icon"], text: categories[index]["text"], press: (){})),
        ],
      ),
    );
  }
}
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,

  }) : super(key: key);
  final String icon, text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 75,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset(icon),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(text, textAlign: TextAlign.center,style: TextStyle(
                fontSize: 16
            ),)
          ],
        ),
      ),
    );
  }
}