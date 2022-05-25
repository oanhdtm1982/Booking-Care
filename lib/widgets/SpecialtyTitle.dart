import 'package:flutter/material.dart';

class SpeciatlyTitle extends StatelessWidget {
  const SpeciatlyTitle({Key? key,
    required this.title,
    required this.image,
    required this.onTap,
    required this.enable}) : super(key: key);
  final String title,image;
  final VoidCallback onTap;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
                image
            ),
                fit: BoxFit.cover)
        ),
      ),
      title: Text(title, style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 19
      ),),
      onTap: onTap,
      enabled: enable,
    );
  }
}
