import 'package:doanchuyennganh/Screens/Welcome/Components/Splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/user.dart';
import 'Welcome/Components/Login/Login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final user = Provider.of<Users>(context);
    print(user);*/
    return MaterialApp(
      home: Scaffold(body: Center(child: Splash(),)),
    );
  }
}