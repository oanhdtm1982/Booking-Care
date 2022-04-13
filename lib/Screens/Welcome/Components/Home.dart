import 'package:flutter/material.dart';
import 'Categories_home.dart';
import 'SectionInfo_home.dart';
import 'EditAccount.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width *0,
            ),
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                    child: Text("Hello \nWelcome back", style: TextStyle(
                      color: Colors.white,
                      fontSize: 22
                    ),),
                  ),]),
            )
          ),
          SizedBox(height: 30,),
          Categories(),
          SizedBox(height: 30,),
          InfoCard(),
          SizedBox(height: 30,),
        ],
      ),
    ));
  }
}





