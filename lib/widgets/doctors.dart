import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/DoctorOption.dart';
import 'package:flutter/material.dart';

import '../Screens/prefixIcon.dart';

class Doctors extends StatelessWidget {
  Doctors({
    required this.id_spec,
    required this.doctor_display,
    required this.doctors,
    Key? key}) : super(key: key);
  List<String> doctors;
  String doctor_display;
  int id_spec;
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      PrefixIcon(iconData: Icons.date_range),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Doctor',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          InkWell(child: Text(doctor_display),
          onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => DoctorOption(
                index_spec: id_spec,
                doctors: doctors,
                doctor_show: doctor_display,
              ))
          ))
        ],
      )
    ]);
  }
}
