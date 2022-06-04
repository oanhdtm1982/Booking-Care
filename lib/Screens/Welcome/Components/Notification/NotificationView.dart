import 'package:doanchuyennganh/Models/Notification.dart';
import 'package:flutter/material.dart';

import 'Notifications.dart';

class NotificationView extends StatelessWidget {
  NotificationView({
    required this.notifications,
    required this.index,
    Key? key }) : super(key: key);
  final List<NotificationModel> notifications;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => NotificationPage()
            ),
                (Route<dynamic> route) => false
        )
        ),
        title: Text(
              notifications[index].title,
            ),
        
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
              child: Text(
                notifications[index].description,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Monserrat',
                  color: Colors.black
                ),
                textAlign: TextAlign.start,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}