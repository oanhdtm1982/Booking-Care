import 'dart:async';
import 'package:doanchuyennganh/Screens/Welcome/Components/Login/GoogleSignIn.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/Screens/welcome_screen.dart';
import 'package:doanchuyennganh/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MyApp(),
    ),  
  );

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Đồ Án Chuyên Ngành',
        theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,),
        /*theme: MyThemes.lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: MyThemes.darkTheme,
        */

        //home: WelcomeScreen(),
      home: TabPage(),
      )
  );
}
