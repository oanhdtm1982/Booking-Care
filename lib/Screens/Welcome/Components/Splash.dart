import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Login/Login.dart';

 class Splash extends StatelessWidget {
   const Splash({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new Login(),
      backgroundColor: Colors.white,
      image: new Image.asset("assets/images/icon.png", 
      height: 100,
      width: 100,
      alignment: Alignment.center,),
      loadingText: Text('Booking Care'),
      photoSize: 100,
      loaderColor: Colors.lightBlue,
    );
   }
 }