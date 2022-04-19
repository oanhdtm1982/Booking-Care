import 'package:doanchuyennganh/Screens/Welcome/Components/Login/GoogleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'GoogleSignIn.dart';
class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
              onPressed: (){
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
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

