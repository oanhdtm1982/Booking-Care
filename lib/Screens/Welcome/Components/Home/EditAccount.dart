import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/Screens/prefixIcon.dart';
import 'package:doanchuyennganh/bloc/register_bloc/booking_bloc.dart';
import 'package:doanchuyennganh/widgets/avatar.dart';
import 'package:doanchuyennganh/widgets/birth_day.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/avatar_email_sign_in.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return BlocBuilder<BookingBloc,BookingState>(
      builder: (context,state){
        if(state is UnLoadedBooking){
          return Center(child: CircularProgressIndicator());
        }
        if(state is BookingLoaded){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => TabPage()
                      ),
                          (Route<dynamic> route) => false
                  )
              ),
              title: Text("Edit Account"),
              actions: [
                IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.save))
              ],
            ),
            body: Container(
              padding: EdgeInsets.only(left: 15, top: 20, right: 15),
              child: GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    user.photoURL != null ?
                    Avatar(path: user.photoURL!) : AvatarEmail(path: "assets/images/avatar.png"),
                    SizedBox(
                      height: 20,
                    ),
                    for(int i = 0;i<state.books.length;i++)
                      if(user.email == state.books[i].email)
                        _formUI(state.books[i].id,
                            user.email != null ? user.email! : state.books[i].email,
                            user.phoneNumber != null ? user.phoneNumber! : state.books[i].phone,
                            state.books[i].birthday.toDate()
                        ),
                  ],
                ),
              ),
            ),
          );
        }
        else{
          return Text("Error");
        }
      },
    );
  }
  _formUI(String id,String email,String phoneNum,DateTime birthday) {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          _buildForm("ID",id,Icons.airline_seat_individual_suite),
          SizedBox(height: 20.0),
          _buildForm("Email",email, Icons.email),
          SizedBox(height: 20.0),
          _buildForm("Phone Number",phoneNum, Icons.phone),
          SizedBox(height: 20.0),
          BirthDay(birthday: birthday),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
  _buildForm(String title,String text,IconData icondata) {
    return TextFormField(
      decoration: InputDecoration(
        // Để mail lúc đăng kí, không edit được
        labelText:title,
        labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: Colors.grey
        ),
        hintText: text,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
        EdgeInsets.only(left: 0, bottom: 11, top: 11, right: 15),
        icon: PrefixIcon(iconData: icondata),
      ),
    );
  }
}





