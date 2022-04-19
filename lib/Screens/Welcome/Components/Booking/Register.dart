import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/MapScreen.dart';
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
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,),
        ),
      ),
      body: ItemPage(),
    );
  }
}

