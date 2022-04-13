import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool varNotify1 = false;
  bool varNotify2 = false;
  bool varNotify3 = false;

  onChangeFuntion1(bool newValue1){
    setState(() {
      varNotify1 = newValue1;
    });
  }

  onChangeFuntion2(bool newValue2){
    setState(() {
      varNotify2 = newValue2;
    });
  }

  onChangeFuntion3(bool newValue3){
    setState(() {
      varNotify3 = newValue3;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue,),
                SizedBox(width: 15,),
                Text("Account", style: TextStyle(fontSize: 23),)
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOption(context, "Change Password"),
            buildAccountOption(context, "Content Settings"),
            buildAccountOption(context, "Social"),
            buildAccountOption(context, "Language"),
            buildAccountOption(context, "Privacy and Security"),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.volume_up_outlined, color: Colors.blue,),
                SizedBox(width: 15),
                Text("Notifications", style: TextStyle(
                  fontSize: 23,
                ),)
              ],
            ),
            Divider(height: 20, thickness: 1,),
            SizedBox(height: 10,),
            buildNotification("Theme Dark", varNotify1, onChangeFuntion1),
            buildNotification("Account Active", varNotify2, onChangeFuntion2),
            buildNotification("Opportunity", varNotify3, onChangeFuntion3),
            SizedBox(
              height: 30,
            ),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onPressed: (){},
                child: Text("SIGN OUT", style: TextStyle(
                  fontSize: 15, letterSpacing: 2.2, color: Colors.black
                ),),
              )
            )
          ],
        ),
      )
    );
  }
  Padding buildNotification(String title, bool value, Function onChangeMethod){
    return Padding(padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.grey[600]
          ),),
          Transform.scale(scale: 0.7,
          child: CupertinoSwitch(
            activeColor: Colors.blue,
            trackColor: Colors.grey,
            value: value,
            onChanged: (bool newValue){
              onChangeMethod(newValue);
            },
          ),)
        ],
    ),);
  }
  GestureDetector buildAccountOption (BuildContext context, String title){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Option 1"),
                Text("Option 2"),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Close") )
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.grey[600]
            ),),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
class ThemeBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, Brightness brightness) builder;
  ThemeBuilder({required this.builder});
  @override
  State<ThemeBuilder> createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

