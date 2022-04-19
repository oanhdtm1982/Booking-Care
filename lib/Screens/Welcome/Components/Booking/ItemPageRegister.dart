import 'package:flutter/material.dart';
import 'MapScreen.dart';
class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            //Address Hospital
            Row(
                children: <Widget>[
                  _prefixIcon(Icons.gps_fixed),
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Address',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15.0,
                                color: Colors.grey)),
                        SizedBox(height: 1),
                        Text('Bệnh viện đa khoa Thủ Đức')
                      ],
                    ),
                    onTap: (){
                      //Google Map
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapScreen()));
                    },
                  )
                ]
            ),
            SizedBox(height: 20.0),
            //ID
            Row(children: <Widget>[
              _prefixIcon(Icons.airline_seat_individual_suite),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('ID',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                          color: Colors.grey)),
                  SizedBox(height: 1),
                  Text('001')
                ],
              )
            ]),
            SizedBox(height: 20.0),

            //BirthDay
            Row(children: <Widget>[
              _prefixIcon(Icons.today),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('BirthDay',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                          color: Colors.grey)),
                  SizedBox(height: 1),
                  Text('00-00-0000')
                ],
              )
            ]),
            SizedBox(height: 20.0),
            //Gender
            Row(children: <Widget>[
              _prefixIcon(Icons.person),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Gender',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                          color: Colors.grey)),
                  SizedBox(height: 1),
                  Text('Male')
                ],
              )
            ]),
            SizedBox(height: 20.0),
            //Mobile
            Row(children: <Widget>[
              _prefixIcon(Icons.phone),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Mobile',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                          color: Colors.grey)),
                  SizedBox(height: 1),
                  Text('+84 12345678')
                ],
              )
            ]),
            SizedBox(height: 20.0),
            //Specially
            Row(children: <Widget>[
              _prefixIcon(Icons.folder_special),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Specialty',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                          color: Colors.grey)),
                  SizedBox(height: 1),
                  Text('...')
                ],
              )
            ]),
            SizedBox(height: 20.0),
            //DayRegister
            Row(children: <Widget>[
              _prefixIcon(Icons.date_range),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Day register & Doctor',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                          color: Colors.grey)),
                  SizedBox(height: 1),
                  Text('00-00-0000 & Nguyen Van A')
                ],
              )
            ]),
            SizedBox(height: 20.0),
            Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  onPressed: (){},
                  child: Text("REGISTER", style: TextStyle(
                      fontSize: 15, letterSpacing: 2.2, color: Colors.white
                  ),),
                )
            )
          ],
        ),
      ),
    );
  }
  _prefixIcon(IconData iconData) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
      child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          margin: const EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(10.0))),
          child: Icon(
            iconData,
            size: 20,
            color: Colors.grey,
          )),
    );
  }
}