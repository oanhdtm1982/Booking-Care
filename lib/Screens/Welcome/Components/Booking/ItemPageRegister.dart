import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/SpecialtyOption.dart';
import 'package:doanchuyennganh/Screens/prefixIcon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/register_bloc/booking_bloc.dart';
import '../../../../widgets/doctors.dart';
import 'MapScreen.dart';
class ItemPage extends StatelessWidget {
  ItemPage({
    this.id_spec = 0,this.id_doc = 0,
    Key? key}) : super(key: key);
  int id_spec;
  int id_doc;
  @override
  Widget build(BuildContext context) {
    final UserAuth = FirebaseAuth.instance.currentUser!;
    return BlocBuilder<BookingBloc,BookingState>(
      builder: (context,state) {
        if (state is UnLoadedBooking) {
          context.read<BookingBloc>().add(LoadBooking());
        }
        if (state is BookingLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BookingLoaded) {
          return SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      //Address Hospital
                      Row(
                          children: <Widget>[
                            PrefixIcon(iconData: Icons.gps_fixed),
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
                              onTap: () {
                                //Google Map
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => GoogleMapScreen()));
                              },
                            )
                          ]
                      ),
                      SizedBox(height: 20.0),
                      //ID
                      Row(children: <Widget>[
                        PrefixIcon(
                            iconData: Icons.airline_seat_individual_suite),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(int i = 0;i<state.books.length;i++)
                              if(UserAuth.email == state.books[i].email)
                                Text(state.books[i].id)
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),

                      //Name
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.drive_file_rename_outline),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(int i = 0;i<state.books.length;i++)
                              if(UserAuth.email == state.books[i].email)
                                Text(state.books[i].name)
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),

                      //BirthDay
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.today),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('BirthDay',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(int i = 0;i<state.books.length;i++)
                              if(UserAuth.email == state.books[i].email)
                                Text(state.books[i].birthday.toDate().toString())
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),

                      //Gender
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.person),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Gender',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(int i = 0;i<state.books.length;i++)
                              if(UserAuth.email == state.books[i].email)
                                Text(state.books[i].gender)
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),
                      //Mobile
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.phone),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Mobile',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(int i = 0;i<state.books.length;i++)
                              if(UserAuth.email == state.books[i].email)
                                Text(state.books[i].phone)
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),

                      //Specially
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.folder_special),
                        GestureDetector(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Specialty',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0,
                                      color: Colors.grey)),
                              SizedBox(height: 1),
                              Text(state.spec[id_spec].spec_name)
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => SpecialtyOption(specialities: state.spec)));
                          },
                        )
                      ]),
                      SizedBox(height: 20.0),
                      //DayRegister
                      Doctors(
                          id_spec: id_spec,
                          doctors: state.spec[id_spec].list_doctors,
                          doctor_display: state.spec[id_spec].list_doctors[id_doc]),
                      SizedBox(height: 20.0),
                      Center(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40),
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                            onPressed: () {},
                            child: Text("REGISTER", style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 2.2,
                                color: Colors.white
                            ),),
                          )
                      )
                    ],
                  ),
                ),
              ));
        }
        else {
          return Text("Something went wrong");
        }
      }
      );
  }
}

