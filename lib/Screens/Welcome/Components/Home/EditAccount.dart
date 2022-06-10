
import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/bloc/register_bloc/booking_bloc.dart';
import 'package:doanchuyennganh/constants.dart';
import 'package:doanchuyennganh/widgets/BuildForm.dart';
import 'package:doanchuyennganh/widgets/avatar.dart';
import 'package:doanchuyennganh/widgets/birth_day.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../bloc/book_add_register_user/book_reg_user_bloc.dart';
import '../../../../widgets/avatar_email_sign_in.dart';
import '../../../../widgets/default_button.dart';
import '../../../prefixIcon.dart';

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
            ),
            body: Container(
             padding: EdgeInsets.only(left: 15, right: 15),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView.builder(
                  itemCount: state.books.length,
                  itemBuilder: (BuildContext context, int index){
                    return Column(
                      children: [
                        if (user.email == state.books[index].email)
                        user.photoURL != null
                            ? Avatar(path: user.photoURL!)
                            : AvatarEmail(path: state.books[index].imagePath),
                        SizedBox(
                          height: 20,
                        ),
                        if (user.email == state.books[index].email)
                          _formUI(
                            state.books[index].id,
                            user.email != null
                                ? user.email!
                                : state.books[index].email,
                            user.phoneNumber != null
                                ? user.phoneNumber!
                                : state.books[index].phone,
                            state.books[index].birthday.toDate()),
                        if(user.email == state.books[index].email)
                          GestureDetector(
                            onTap: (){
                              print(index);
                              BlocProvider.of<BookRegUserBloc>(context)
                              .add(UpdateBookingRegUser(state.books[index],_phoneController.text.trim()));
                            },
                            child: DefaultButton(text: 'Save',
                              color: Colors.white,
                              customWidth: 150,
                            )
                          )
                      ]
                    );     
                  }
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
          BuildText(text: id,title: "ID",iconData: Icons.airline_seat_individual_suite),
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

class BuildText extends StatelessWidget {
  BuildText({
    Key? key,
    required this.text,
    required this.title,
    required this.iconData,
  }) : super(key: key);
  String text,title;
  IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PrefixIcon(iconData: iconData),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey
              ),),
              Text(text, style:TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey
              ),),
            ]
          ),
        )
    ]);
  }
}
