import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/Register.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Notification/Notifications.dart';
import 'Calendar/Calendar.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Home/Home.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Setting/Setting.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  TabPage({Key? key}) : super(key: key);
  @override
  State<TabPage> createState() => _TabState();
}

class _TabState extends State<TabPage> {
  int currentIndex = 0;
  final screen = [
    HomePage(),
    CalendarPage(),
    RegisterPage(),
    NotificationPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        onTap: (index) => setState(
            () => currentIndex = index,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blueAccent,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: "Calendar",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Register",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            label: "Notification",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
            backgroundColor: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}