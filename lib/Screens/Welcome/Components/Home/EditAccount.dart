import 'package:doanchuyennganh/Screens/prefixIcon.dart';
import 'package:doanchuyennganh/widgets/avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
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
              Avatar(path: user.photoURL!),
              SizedBox(
                height: 20,
              ),
              _formUI(user.uid != null ? user.uid : "uid",
                  user.email != null ? user.email! : "email",
                  user.phoneNumber != null ? user.phoneNumber! : "Phone Number"),
            ],
          ),
        ),
      ),
    );
  }
  _formUI(String uid,String email,String phoneNum) {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          _id(uid),
          SizedBox(height: 20.0),
          _buildForm(email, Icons.email),
          SizedBox(height: 20.0),
          _buildForm(phoneNum, Icons.phone),
          SizedBox(height: 20.0),
          BirthDay(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
  _id(String id){
    return TextFormField(
      decoration: InputDecoration(
        labelText: id,
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
        icon: PrefixIcon(iconData: Icons.airline_seat_individual_suite),
      ),
    );
  }
  _buildForm(String text,IconData icondata) {
    return TextFormField(
      decoration: InputDecoration(
        // Để mail lúc đăng kí, không edit được
        labelText: text,
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
        icon: PrefixIcon(iconData: icondata),
      ),
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
      PrefixIcon(iconData: Icons.date_range),
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

}



