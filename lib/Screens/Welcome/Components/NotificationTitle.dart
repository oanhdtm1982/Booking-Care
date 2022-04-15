import 'package:flutter/material.dart';
class NotificationTitle extends StatelessWidget {
  const NotificationTitle({Key? key,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.enable}) : super(key: key);
  final String title;
  final String subTitle;
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
                'assets/images/icon.png'
            ),
                fit: BoxFit.cover)
        ),
      ),
      title: Text(title, style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 19
      ),),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onTap: onTap,
      enabled: enable,
    );
  }
}
