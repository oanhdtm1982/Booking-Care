import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _account;
  GoogleSignInAccount get account => _account!;
  Future googleLogin() async{
    try{
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _account = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch(e){
      print(e.toString());
    }
    notifyListeners();
  }
  Future logout() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}