import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanchuyennganh/Models/Booking.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/bloc/auth_bloc/auth_bloc.dart';
import 'package:doanchuyennganh/bloc/book_add_register_user/book_reg_user_bloc.dart';
import 'package:doanchuyennganh/bloc/register_bloc/booking_bloc.dart';
import 'package:doanchuyennganh/widgets/CustomShowSnackBar.dart';
import 'package:doanchuyennganh/widgets/birth_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../Setting/ThemeHelper.dart';
import 'Header.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final Timestamp _dateTime = Timestamp.now();
  File? imageFile;
  Future<void> _openGallary(BuildContext context) async {
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Register Account"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => TabPage()),
                  (Route<dynamic> route) => false);
              context.read<BookingBloc>().add(LoadBooking());
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: CustomSnackBarContent(errorText: "error")));
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UnAuthenticated) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      child: HeaderWidget(
                          150, false, Icons.person_add_alt_1_rounded),
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
                                        onTap: () {
                                          _openGallary(context);
                                        },
                                        child: imageFile != null
                                            ? Image.file(imageFile!,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover)
                                            : Icon(
                                                Icons.person,
                                                color: Colors.grey.shade300,
                                                size: 80.0,
                                              ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(80, 80, 0, 0),
                                        child: Icon(
                                          Icons.add_circle,
                                          color: Colors.grey.shade700,
                                          size: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _nameController,
                                    onSaved: (value) =>
                                        _nameController.text = value!,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'Name', 'Enter your first name'),
                                  ),
                                  decoration: ThemeHelper()
                                      .inputBoxDecorationShaddow(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _genderController,
                                    onSaved: (value) =>
                                        _genderController.text = value!,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'Gender', 'Enter your gender'),
                                  ),
                                  decoration: ThemeHelper()
                                      .inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    controller: _emailController,
                                    onSaved: (value) =>
                                        _emailController.text = value!,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("E-mail address",
                                            "Enter your email"),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (!(val!.isEmpty) &&
                                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                              .hasMatch(val)) {
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration: ThemeHelper()
                                      .inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    controller: _phoneController,
                                    onSaved: (value) =>
                                        _phoneController.text = value!,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("Mobile Number",
                                            "Enter your mobile number"),
                                    keyboardType: TextInputType.phone,
                                    validator: (val) {
                                      if (!(val!.isEmpty) &&
                                          !RegExp(r"^(\d+)*$")
                                              .hasMatch(val)) {
                                        return "Enter a valid phone number";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration: ThemeHelper()
                                      .inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    controller: _passwordController,
                                    onSaved: (value) =>
                                        _passwordController.text = value!,
                                    obscureText: true,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("Password*",
                                            "Enter your password"),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter your password";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration: ThemeHelper()
                                      .inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  child:
                                      BirthDay(birthday: _dateTime.toDate()),
                                  decoration: ThemeHelper()
                                      .inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 15.0),
                                FormField<bool>(
                                  builder: (state) {
                                    return Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Checkbox(
                                                value: checkboxValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    checkboxValue = value!;
                                                    state.didChange(value);
                                                  });
                                                }),
                                            Text(
                                              "I accept all terms and conditions.",
                                              style: TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            state.errorText ?? '',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .errorColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  validator: (value) {
                                    if (!checkboxValue) {
                                      return 'You need to accept terms and conditions';
                                    } else {
                                      return null;
                                    }
                                  },
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
                                              "Register".toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            _createAccountwithEmailAndPassword(
                                                context);
                                            var BookingUser = Booking(
                                                phone: _phoneController.text
                                                    .trim(),
                                                id: (state.books.length + 1)
                                                    .toString(),
                                                name: _nameController.text
                                                    .trim(),
                                                gender: _genderController.text
                                                    .trim(),
                                                birthday: _dateTime,
                                                imagePath:
                                                    imageFile.toString(),
                                                email: _emailController.text
                                                    .trim());
                                               BlocProvider.of<BookRegUserBloc>(context).add(
                                                        AddBookingRegUser(BookingUser));
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
            } else {
              return Center(child: Text("Something went wrong"));
            }
          }),
        ));
  }

  void _createAccountwithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
          SignUpRequested(_emailController.text, _passwordController.text));
    }
  }
}