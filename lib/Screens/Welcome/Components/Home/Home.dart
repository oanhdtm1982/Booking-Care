
import 'package:doanchuyennganh/Service/Database.dart';
import 'package:flutter/material.dart';
import 'Categories_home.dart';
import 'SectionInfo_home.dart';
import 'EditAccount.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanchuyennganh/Models/user.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Login/Login.dart' as Login;

final String uid = Login.Email;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String RouteName = "/Home";
  @override
  Widget build(BuildContext context) {
    return BodyHomePage();
  }
}

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width *0,
              ),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccount()));
                          },
                          child: Image.asset("assets/images/avatar.png",)),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Hello, \nWelcome back", style: TextStyle(
                            color: Colors.white,
                            fontSize: 22
                        ),),
                      ),]),
              )
          ),
          SizedBox(height: 25,),
          Categories(),
          SizedBox(height: 30,),
          InfoCard(),
          SizedBox(height: 10,),
          BannerCard(),
          SizedBox(height: 50,),
        ],
      ),
    ));
  }
}








