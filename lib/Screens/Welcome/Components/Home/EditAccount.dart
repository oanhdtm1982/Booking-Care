import 'dart:io';

import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/Screens/prefixIcon.dart';
import 'package:doanchuyennganh/bloc/register_bloc/booking_bloc.dart';
import 'package:doanchuyennganh/widgets/BuildForm.dart';
import 'package:doanchuyennganh/widgets/avatar.dart';
import 'package:doanchuyennganh/widgets/birth_day.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../widgets/avatar_email_sign_in.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state is UnLoadedBooking) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is BookingLoaded) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => TabPage()),
                      (Route<dynamic> route) => false)),
              title: Text("Edit Account"),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
            ),
            body: Container(
              padding: EdgeInsets.only(left: 15, top: 20, right: 15),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    for (int i = 0; i < state.books.length; i++)
                      if (user.email == state.books[i].email)
                        user.photoURL != null
                            ? Avatar(path: user.photoURL!)
                            : AvatarEmail(path: state.books[i].imagePath),
                    SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < state.books.length; i++)
                      if (user.email == state.books[i].email)
                        _formUI(
                            state.books[i].id,
                            user.email != null
                                ? user.email!
                                : state.books[i].email,
                            user.phoneNumber != null
                                ? user.phoneNumber!
                                : state.books[i].phone,
                            state.books[i].birthday.toDate()),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Text("Error");
        }
      },
    );
  }

  _formUI(String id, String email, String phoneNum, DateTime birthday) {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          BuildForm(
              controller: _idController,
              title: "ID",
              text: id,
              icondata: Icons.airline_seat_individual_suite),
          SizedBox(height: 20.0),
          BuildForm(
              controller: _emailController,
              title: "Email",
              text: email,
              icondata: Icons.email),
          SizedBox(height: 20.0),
          BuildForm(
              controller: _phoneController,
              title: "Phone Number",
              text: phoneNum,
              icondata: Icons.phone),
          SizedBox(height: 20.0),
          BirthDay(birthday: birthday),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
