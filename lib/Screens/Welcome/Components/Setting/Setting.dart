import 'package:doanchuyennganh/Screens/Welcome/Components/Login/Login.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Setting/change_password.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Setting/privacy_and_security.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../bloc/auth_bloc/auth_bloc.dart';

class SettingPage extends StatefulWidget {
  SettingPage({
    Key? key}) : super(key: key);
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
    return BlocListener<AuthBloc,AuthState>(
      listener: (context,state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => Login()
              ),
                  (Route<dynamic> route) => false
          );
        }
      },
        child: BlocBuilder<AuthBloc,AuthState>(
          builder: (context,state)
    {
      if (state is Authenticated) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                "Settings",
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) {
                    return TabPage();
                  }));
                },
                icon: Icon(Icons.arrow_back,
                  color: Colors.white,),
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
                      Text("Other", style: TextStyle(
                        fontSize: 23,
                      ),)
                    ],
                  ),
                  Divider(height: 20, thickness: 1,),
                  SizedBox(height: 10,),
                  BlocBuilder<ThemeCubit,bool>(
                    builder: (context,state){
                      return SwitchListTile(
                          title: Text("Dark Mode",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[600]
                          ),),
                          value: state,
                          onChanged: (value){
                            BlocProvider.of<ThemeCubit>(context).toggleTheme(value: value);
                          });
                    },
                  ),
                  buildNotification(
                      "Account Active", varNotify2, onChangeFuntion2),
                  buildNotification(
                      "Opportunity", varNotify3, onChangeFuntion3),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40),
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),
                        onPressed: () {
                          context.read<AuthBloc>().add(
                              SignOutRequested());
                        },
                        child: Text("SIGN OUT", style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2.2,
                            color: Colors.white
                        ),),
                      )
                  )
                ],
              ),
            )
        );
      }
      else {
        return Center(child: CircularProgressIndicator());
      }
    })

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
        if (title == "Privacy and Security"){
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => PrivacyAndSecurity()
              ),
                  (Route<dynamic> route) => false
          );
        }
        else if (title == "Change Password")
          {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => ChangePassword()
                ),
                    (Route<dynamic> route) => false
            );
          }
        else {

        }
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




