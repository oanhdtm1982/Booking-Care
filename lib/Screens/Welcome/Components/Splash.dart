import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'Login.dart';

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
      loadingText: Text('Đồ Án Chuyên Ngành'),
      photoSize: 100,
      loaderColor: Colors.lightBlue,
    );
   }
 }