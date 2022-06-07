import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanchuyennganh/Models/Booking.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/bloc/auth_bloc/auth_bloc.dart';
import 'package:doanchuyennganh/bloc/email_information_register/email_information_register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../bloc/register_bloc/booking_bloc.dart';
import '../../../../widgets/birth_day.dart';
import '../Setting/ThemeHelper.dart';
import 'Header.dart';

class AddInfo extends StatefulWidget {
  const AddInfo({Key? key}) : super(key: key);

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final Timestamp _dateTime = Timestamp.now();
  File? imageFile;
  Future<void>_openGallary(BuildContext context) async {
    XFile? picture = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(picture!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AuthBloc,AuthState>(builder: (context,state){
          if(state is Loading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is UnAuthenticated){
            return const Center(child: Text("Account being Authenticated"));
          }
          if(state is Authenticated){
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              GestureDetector(
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        _openGallary(context);
                                      },
                                      child: imageFile != null ? Image.file(imageFile!,
                                          width: 100,height: 100,
                                          fit: BoxFit.cover
                                      ) :
                                      Icon(
                                        Icons.person,
                                        color: Colors.grey.shade300,
                                        size: 80.0,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey.shade700,
                                        size: 25.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30,),
                             
                              Container(
                                child: TextFormField(
                                  controller: _genderController,
                                  onSaved: (value) => _genderController.text = value!,
                                  decoration: ThemeHelper().textInputDecoration('Gender', 'Enter your gender'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              
                             
                              SizedBox(height: 20.0),
                              Container(
                                child: TextFormField(
                                  controller: _phoneController,
                                  onSaved: (value) => _phoneController.text = value!,
                                  decoration: ThemeHelper().textInputDecoration(
                                      "Mobile Number",
                                      "Enter your mobile number"),
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    if((val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                      return "Enter a valid phone number";
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20),
                              Container(
                                    child:
                                        BirthDay(birthday: _dateTime.toDate()),
                                    decoration: ThemeHelper()
                                        .inputBoxDecorationShaddow(),
                                  ),
                              SizedBox(height: 20.0),
                            
                              BlocBuilder<BookingBloc, BookingState>(
                                    builder: (context, state) {
                                      if (state is UnLoadedBooking) {
                                        context
                                            .read<BookingBloc>()
                                            .add(LoadBooking());
                                      }
                                      if (state is LoadBooking) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      if (state is BookingLoaded) {
                                        return Container(
                                          decoration: ThemeHelper()
                                              .buttonBoxDecoration(context),
                                          child: ElevatedButton(
                                            style: ThemeHelper().buttonStyle(),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      40, 10, 40, 10),
                                              child: Text(
                                                "Add".toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              var BookingUser = Booking(
                                                  phone: _phoneController.text
                                                      .trim(),
                                                  id: (state.books.length + 1)
                                                      .toString(),
                                                  name: user.displayName!= null ? user.displayName! : "",
                                                  gender: _genderController.text
                                                      .trim(),
                                                  birthday: _dateTime,
                                                  imagePath: user.photoURL!,
                                                  email: user.email!);
                                                 BlocProvider.of<EmailRegUserBloc>(context).add(
                                                          AddEmailRegUser(BookingUser));
                                                  Navigator.of(context).pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) => TabPage()
                                                      ),
                                                          (Route<dynamic> route) => false
                                                  );
                                            },
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          else{
            return Center(child: Text("Something went wrong"));
          }
        }
        ));

  }
}
