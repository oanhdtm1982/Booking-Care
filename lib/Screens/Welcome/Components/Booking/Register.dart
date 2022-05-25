import 'package:doanchuyennganh/Models/Speciality.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/MapScreen.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:flutter/material.dart';
import 'ItemPageRegister.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Register",),
        leading: IconButton(
          onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return TabPage();
            }));
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,),
        ),
      ),
      body: ItemPage(),
    );
  }
}

