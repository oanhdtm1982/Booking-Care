import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/Register.dart';
import 'package:doanchuyennganh/widgets/SpecialtyTitle.dart';
import 'package:flutter/material.dart';

import '../../../../Models/Speciality.dart';

class DoctorOption extends StatefulWidget {
  DoctorOption({
    required this.index_spec,
    this.index_doc = 0,
    required this.doctor_show,
    required this.doctors,
    Key? key}) : super(key: key);
  List<String> doctors;
  String doctor_show;
  int index_doc;
  int index_spec;
  @override
  State<DoctorOption> createState() => _DoctorOptionState();
}

class _DoctorOptionState extends State<DoctorOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Doctors",),
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
              image: 'assets/images/icon.png',
              title: widget.doctors[index],
              enable: true,
              onTap: () {
                setState(() {
                  widget.index_doc = index;
                  widget.doctor_show = widget.doctors[index];
                });
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage(id_doc: widget.index_doc,id_spec: widget.index_spec)));
              }
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: widget.doctors.length),
    );
  }
}
