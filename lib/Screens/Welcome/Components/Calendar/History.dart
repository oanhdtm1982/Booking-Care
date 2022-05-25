import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class History extends StatelessWidget {
  History({Key? key}) : super(key: key);
  List<String> doctors = ["Helmet Tica","UIT", "MMTT"];
  List<IconData> icons = [
    Icons.person,
    Icons.folder_special,
    Icons.date_range
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 3,style: BorderStyle.none),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: size.width/3,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                        colors: [
                      Colors.lightBlueAccent,
                      Colors.blue,
                    ]),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2,style: BorderStyle.none),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Information",style: TextStyle(
                      fontSize: 20,
                      //fontFamily: "Helvetica",
                      color: Colors.black
                    ),
                    ),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 20),
          for(int i = 0;i<3;i++)
            DoctorInformation(doctors: doctors[i], icon: icons[i],sizeIcon: 30,)
        ],
      ),
    );
  }
}
class DoctorInformation extends StatelessWidget {
  const DoctorInformation({
    required this.doctors,
    required this.icon,
    required this.sizeIcon,
    Key? key}) : super(key: key);
  final String doctors;
  final IconData icon;
  final double sizeIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Spacer(),
            Icon(
              icon,
              size: sizeIcon,
              color: Colors.grey,
            ),
            Spacer(),
            Text(doctors,
              style: TextStyle(
                /*fontFamily: "Helvetica",*/
               //fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
            Spacer(flex: 10),
          ],
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
