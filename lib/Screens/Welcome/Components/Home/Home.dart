import 'package:doanchuyennganh/bloc/banner_bloc/banner_bloc.dart';
import 'package:doanchuyennganh/widgets/webview_navigating.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/InfoCard.dart';
import 'Categories_home.dart';
import 'EditAccount.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String RouteName = "/Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyHomePage());
  }
}

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _index = 0;
    bool _isChecked = false;
    final user = FirebaseAuth.instance.currentUser!;
    return BlocListener<BannerBloc, BannerState>(
        listener: (context, state) {
          if (state is BannerError) {
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Banner is showing error")));
          }
          if (state is BannerLoaded) {
            if(_isChecked == true){
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                          WebViewNavigating(path: state.banners[_index].path)
                  ),
                      (Route<dynamic> route) => false
              );
            }
          }
        },
        child: BlocBuilder<BannerBloc, BannerState>(
          builder: (context, state) {
            if (state is BannerLoaded) {
              return SafeArea(child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery
                              .of(context)
                              .size
                              .width * 0,
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
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => EditAccount()));
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle
                                      ),
                                      child: 
                                      user.photoURL != null ?
                                      Image.network(
                                        user.photoURL!,fit: BoxFit.cover,) : Image.asset("assets/images/avatar.png"),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text("Hello, \n${
                                      user?.displayName != null ? user
                                          ?.displayName : "Welcome back"
                                  }", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22
                                  ),),
                                ),
                              ]),
                        )
                    ),
                    SizedBox(height: 25,),
                    Categories(),
                    SizedBox(height: 30,),
                    InfoCard(list_banner: state.banners, index_Card: _index,isCheck: _isChecked),
                  ],
                ),
              ));
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
    );
  }
}








