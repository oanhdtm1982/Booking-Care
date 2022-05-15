import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/Register.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/SpecialtyTitle.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Notification/NotificationDetail.dart';
import 'package:flutter/material.dart';

class SpecialtyOption extends StatefulWidget {
  const SpecialtyOption({Key? key}) : super(key: key);

  @override
  State<SpecialtyOption> createState() => _SpecialtyOptionState();
}

class _SpecialtyOptionState extends State<SpecialtyOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Speciatly",),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return RegisterPage();
            }));
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,),
        ),
      ),
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index){
            return SpeciatlyTitle(
              title: 'Specialty',
              subTitle: 'Khoa khám bệnh',
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
