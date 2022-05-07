import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
              _avatar(),
              SizedBox(
                height: 20,
              ),
              _formUI(),
            ],
          ),
        ),
      ),
    );
  }
  _avatar(){
    Future pickImage() async{
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null){
          return;
        }
        final imageTemporary = File(image.path);
        setState(() {
          this._image = imageTemporary;
        });
      } on PlatformException catch (e){

      }
    }

    return Center(
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                pickImage();
              },
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1)
                    )
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/avatar.png"),
                    //image:  FileImage(_image!),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 4,
                      color: Colors.white
                  ),
                  color: Colors.blueAccent,
                ),
                  child: Icon(Icons.edit,color: Colors.white,)
              ),
            ),
          ],
        ),
    );
}
  _formUI() {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
/*          SizedBox(height: 20.0),
          _cover(),*/
          SizedBox(height: 20.0),
          _id(),
          SizedBox(height: 20.0),
          _email(),
          SizedBox(height: 20.0),
          _mobile(),
          SizedBox(height: 20.0),
          BirthDay(),
          SizedBox(height: 20.0),
          _gender(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
  _id(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "ID",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
            color: Colors.grey
        ),

        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
        EdgeInsets.only(left: 0, bottom: 11, top: 11, right: 15),
        icon: _prefixIcon(Icons.airline_seat_individual_suite),
      ),
    );
  }
  _email() {
    return TextFormField(
      decoration: InputDecoration(
        // Để mail lúc đăng kí, không edit được
        labelText: "Email",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
            color: Colors.grey
        ),

        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
        EdgeInsets.only(left: 0, bottom: 11, top: 11, right: 15),
        icon: _prefixIcon(Icons.email),
      ),
    );
  }
  _mobile() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "PhoneNumber",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
            color: Colors.grey
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
        EdgeInsets.only(left: 0, bottom: 11, top: 11, right: 15),
        icon: _prefixIcon(Icons.phone),
      ),
    );
  }
  _gender() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Gender",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
            color: Colors.grey
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
        EdgeInsets.only(left: 0, bottom: 11, top: 11, right: 15),
        icon: _prefixIcon(Icons.person),
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

class BirthDay extends StatefulWidget {
  const BirthDay({Key? key}) : super(key: key);

  @override
  State<BirthDay> createState() => _BirthDayState();
}

class _BirthDayState extends State<BirthDay> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 3, 5),
        lastDate: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      _prefixIcon(Icons.date_range),
      GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Birth date',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                      color: Colors.grey)),
              SizedBox(height: 1),
              Text('${selectedDate.toLocal()}'.split(' ')[0]),
            ],
          ),
        ),

        onTap: () => _selectDate(context),
      )
    ]);
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



