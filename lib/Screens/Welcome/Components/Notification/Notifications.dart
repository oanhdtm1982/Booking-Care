import 'package:flutter/material.dart';
import 'NotificationTitle.dart';
import 'NotificationDetail.dart';
class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Notifications",),
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,),
        ),
      ),
      body: ListView.separated(
        physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index){
            return NotificationTitle(
              title: 'DoAn',
              subTitle: 'Thanks for download DoAn',
              enable: true,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationDetail())),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: 12),
    );
  }
}
