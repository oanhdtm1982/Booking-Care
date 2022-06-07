import 'package:doanchuyennganh/Models/Booking.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Login/AddInformation.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Login/ForgotPasswordPage.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Login/RegisterAccount.dart';
import 'package:doanchuyennganh/bloc/auth_bloc/auth_bloc.dart';
import 'package:doanchuyennganh/bloc/book_add_register_user/book_reg_user_bloc.dart';
import 'package:doanchuyennganh/bloc/email_information_register/email_information_register_bloc.dart';
import 'package:doanchuyennganh/bloc/register_bloc/booking_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Setting/ThemeHelper.dart';
import '../Tab.dart';

class Login extends StatefulWidget {
  Login({
    Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPass = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  var _userError = "Tài khoản không hợp lệ";
  var _passError = "Password phải trên 6 ký tự";
  var _userInvalid = false;
  var _passInvalid = false;
  bool? remember = false;
  final _formKey = GlobalKey<FormState>();
  
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
    Size size = MediaQuery.of(context).size;
    final String password = "";
    return BlocListener<AuthBloc,AuthState>(listener: (context, state){
      if(state is Authenticated){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => TabPage()
            ),
                (Route<dynamic> route) => false
        );
      }
      if(state is AuthError){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error")));
      }
    }, child: BlocBuilder<AuthBloc,AuthState>
      (builder: (context,state){
      if(state is Loading){
        return Center(child: CircularProgressIndicator());
      }
      if(state is UnAuthenticated){
        return MaterialApp(
          key: _formKey,
          home: Scaffold(
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              constraints: BoxConstraints.expand(),
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 190),
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
                      child: TextFormField(
                        controller: _userController,
                        onSaved: (value) => _userController.text = value!,
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
                              child: TextFormField(
                                controller: _passController,
                                onSaved: (value) => _passController.text = value!,
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
                      child: GestureDetector(onTap:(){
                        onSignInClicked(context,password);
                      },
                          child: Container(
                            height: 50,
                              width: MediaQuery.of(context).size.height - 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("SIGN IN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Helvetica",
                                  ),
                                ),
                              )
                          )),
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: FaIcon(
                            FontAwesomeIcons.googlePlus, size: 35,
                            color: HexColor("#EC2D2F"),),
                          onTap: () async{
                            BlocProvider.of<EmailRegUserBloc>(context).add(
                                 LoadEmailRegUser()
                                );
                            BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequested());  
                          },
                        ),
                        SizedBox(width: 30.0,),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 5, color: HexColor("#40ABF0")),
                              color: HexColor("#40ABF0"),
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.twitter, size: 23,
                              color: HexColor("#FFFFFF"),),
                          ),
                          onTap: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ThemeHelper().alertDialog("Twitter","You tap on Twitter social icon.",context);
                                },
                              );
                            });
                          },
                        ),
                        SizedBox(width: 30.0,),
                        GestureDetector(
                          child: FaIcon(
                            FontAwesomeIcons.facebook, size: 35,
                            color: HexColor("#3E529C"),),
                          onTap: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ThemeHelper().alertDialog("Facebook",
                                      "You tap on Facebook social icon.",
                                      context);
                                },
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      width: size.width,
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
          ),
        );
      }
      else{
        return Center(child: Text("Something went wrong"));
      }
    }),
    
    );
  }
 void onSignInClicked(BuildContext context,String password) {
     password = _passController.text;
     BlocProvider.of<AuthBloc>(context).add(
       SignInRequested(_userController.text, _passController.text)
     );
 }
  void onShowPass(){
    setState(() {
      _showPass = !_showPass;
    });
  }
}