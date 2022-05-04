import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
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
          onTap: (){FocusScope.of(context).unfocus();},
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
    return Center(
      child: Stack(
        children: [
          Container(
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
              child: Icon(Icons.edit,color: Colors.white,),
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
          _birthDate(),
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
  _birthDate() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.date_range),
      GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Birth date',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                    color: Colors.grey)),
            SizedBox(height: 1),
            Text('00-00-0000')
          ],
        ),
        onTap: (){
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1950, 3, 5),
              maxTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day), onChanged: (date) {
                print('change $date');
              },
              onConfirm: (date) {
                print('confirm $date');
              },
              currentTime: DateTime.now(),
              locale: LocaleType.vi,
          );
        },
      )
    ]);
  }
  _gender() {
    return Row(children: <Widget>[
      _prefixIcon(Icons.person),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Gender',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          SizedBox(height: 1),
          Text('Male')
        ],
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
