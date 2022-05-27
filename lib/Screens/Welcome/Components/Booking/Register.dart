import 'package:doanchuyennganh/Models/Speciality.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/MapScreen.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:flutter/material.dart';
import 'ItemPageRegister.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    this.id_spec = 0,
    this.id_doc = 0,
    Key? key}) : super(key: key);
  int id_spec;
  int id_doc;
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
      body: ItemPage(id_spec: id_spec,id_doc: id_doc),
    );
  }
}

