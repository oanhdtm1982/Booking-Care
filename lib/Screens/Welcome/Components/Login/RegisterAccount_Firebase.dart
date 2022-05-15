import 'package:doanchuyennganh/Auth/Authentication.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Home/Home.dart';
import 'package:doanchuyennganh/Auth/GoogleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../Auth/GoogleSignIn.dart';
class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({required this.toggleView});
  //const SignUp({Key? key}) : super(key: key);

  _signUpState createState() => _signUpState();
}

class _signUpState extends State<SignUp> {

  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("RegisterAccount"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/images/icon.png'),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Hello\nWelcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                ),),
            ),
            SizedBox(height: 8,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Register to your gmail continue',
                style: TextStyle(fontSize: 16),

              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () async {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.googleLogin();
                if (provider.hasListeners){
                  Navigator.pushNamed(context, HomePage.RouteName);
                }
              },
              label: Text('Sign Up With Google'),
              icon: FaIcon(FontAwesomeIcons.google,
                color: Colors.white,),
            ),

            SizedBox(height: 40,),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

