import 'package:doanchuyennganh/Screens/Welcome/Components/Splash.dart';
import 'package:flutter/material.dart';
import 'Welcome/Components/Login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Splash(),)),
    );
  }
}