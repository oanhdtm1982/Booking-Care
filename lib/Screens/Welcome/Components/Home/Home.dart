
import 'package:doanchuyennganh/Screens/Welcome/Components/Login/AddInformation.dart';
import 'package:doanchuyennganh/bloc/banner_bloc/banner_bloc.dart';
import 'package:doanchuyennganh/bloc/register_bloc/booking_bloc.dart';
import 'package:doanchuyennganh/widgets/CustomShowSnackBar.dart';
import 'package:doanchuyennganh/widgets/webview_navigating.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/email_information_register/email_information_register_bloc.dart';
import '../../../../widgets/InfoCard.dart';
import '../../../../widgets/avatar.dart';
import '../../../../widgets/avatar_email_sign_in.dart';
import 'Categories_home.dart';
import 'EditAccount.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String RouteName = "/Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyHomePage());
  }
}

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _index = 0;
    bool _isChecked = false;
    final user = FirebaseAuth.instance.currentUser!;
    final state_books;
    
    return BlocListener<EmailRegUserBloc,EmailRegUserState>(
      listener: ((context, state){
        if(state is EmailRegUserLoaded){
          for (int i = 0; i < state.emailRegUsers.length; i++)
              if (user.email != state.emailRegUsers[i].email && state.emailRegUsers[i].email.indexOf(user.email!) == -1){
                Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => AddInfo()
            ),
                (Route<dynamic> route) => false
        );
              }
        }   
      }),
      child: BlocListener<BannerBloc, BannerState>(listener: (context, state) {
        if (state is BannerError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: CustomSnackBarContent(errorText: "Error")));
        }
        if (state is BannerLoaded) {
          if (_isChecked == true) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        WebViewNavigating(path: state.banners[_index].path)),
                (Route<dynamic> route) => false);
          }
        }
      }, child: BlocBuilder<BannerBloc, BannerState>(
        builder: (context, state) {
          if (state is BannerLoaded) {
            return SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0,
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
                              GestureDetector(onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditAccount()));
                              }, child: BlocBuilder<BookingBloc, BookingState>(
                                builder: (context, state) {
                                  if (state is UnLoadedBooking) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (state is BookingLoaded) {
                                    for (int i = 0; i < state.books.length; i++)
                                      if (user.email == state.books[i].email)
                                        return Row(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle),
                                              child: user.photoURL != null
                                                  ?  Avatar(path: user.photoURL!)
                                        : AvatarEmail(path: state.books[i].imagePath),
                                            ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              "Hello, \n${user.displayName != null ? user.displayName :  state.books[i].name}",
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      );
                                    return Container();
                                  } else {
                                    return Image.asset(
                                        "assets/images/avatar.png");
                                  }
                                },
                              )),
                              
                            ]),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Categories(),
                  SizedBox(
                    height: 30,
                  ),
                  InfoCard(
                      list_banner: state.banners,
                      index_Card: _index,
                      isCheck: _isChecked),
                ],
              ),
            ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
