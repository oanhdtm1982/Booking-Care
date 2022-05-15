
import 'package:doanchuyennganh/Auth/Authentication.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Login/ForgotPasswordPage.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Login/RegisterAccount.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Login/RegisterAccount_Firebase.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Keyboard.dart';
import '../Tab.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userError = "Tài khoản không hợp lệ";
  var _passError = "Password phải trên 6 ký tự";
  var _userInvalid = false;
  var _passInvalid = false;
  String? email;
  String? password;
  bool? remember = false;
  
  final List<String> errors = [];
  void addError({required String error}){
    if(!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }
  void removeError({String? error}){
    if(errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      key: _formKey,
          home: Scaffold(
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              constraints: BoxConstraints.expand(),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffd8d8d8)),
                    child: FlutterLogo()),
                ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Text("Hello\nWelcome Back", style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      controller: _userController,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      decoration: InputDecoration(labelText: "Email",
                      errorText: _userInvalid? _userError:null,
                      labelStyle:
                      TextStyle(color: Color(0xff888888), fontSize: 18)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          controller: _passController,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          obscureText: !_showPass,
                          decoration: InputDecoration(labelText: "Password",
                          errorText: _passInvalid?_passError: null,
                          labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 18)),
                        ),

                      ),
                      GestureDetector(
                        onTap: onShowPass,
                        child: Text(_showPass? "HIDE": "SHOW", style: TextStyle(color: Colors.blue, fontSize: 13, fontWeight: FontWeight.bold ),))
                      ]

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(onPressed: onSignInClicked ,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text("SIGN IN", style: TextStyle(fontSize: 16, color: Colors.white),)),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            child: Text("REGISTER",
                              style: TextStyle(fontSize: 12, color: Colors.blue),),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAccount()));
                          },
                        ),
                        GestureDetector(
                            child: Text("FORGOT PASSSWORD?", style: TextStyle(fontSize: 12, color: Colors.blue),),
                          onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                          },
                        )
                      ],
                    ),
                  ),
              ],),
            ),
          ),
    );
  }
 Future<void> onSignInClicked() async{
   print(email);
   print(password);
   dynamic result =  await _authService.signInWithEmailAndPassword(email!, password!);
   if (result == null) {
        print('error signing in');
   } else {
        print('signed in');
        Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage()));
        print(result);
   }

  /* if(_formKey.currentState!.validate()){
     _formKey.currentState!.save();
     KeyboardUtil.hideKeyboard(context);
   }
    setState(() {
      if (_userController.text.length > 6){
        _userInvalid = true;
        signin(email!, password!);
        FirebaseAuth.instance.idTokenChanges().listen((User ? user) {
          if(user==null){
            print("User is currently signed out");
          }
          else{
            print("Logged in");
            Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage()));
          }
        });
      }
    });*/

  }

  /*void onSignInClicked(){
    setState(() {
      if (_userController.text.length < 6){
        _userInvalid = true;
      }
      else {_userInvalid = false;}
      if (_passController.text.length < 6){
        _passInvalid = true;
      }
      else{_passInvalid = false;}
      if (_userInvalid == false && _passInvalid == false){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage()));
      }
    });
  }*/

  void onShowPass(){
    setState(() {
      _showPass = !_showPass;
    });
  }
}