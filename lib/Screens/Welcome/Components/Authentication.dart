import 'package:doanchuyennganh/Screens/Welcome/Components/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:doanchuyennganh/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user object based on UserCredential
  Users? _userFromUserCredential(User? user) {
    if (user != null) {
      return Users(user.uid, "" ,"", "", "", "", "", "", "", "", "", "", "");
    } else {
      return null;
    }
  }
  //sign in anon

  /*Future<Users?> signInAnon() async {
    try {
      UserCredential _userCredential = await _auth.signInAnonymously();
      User? user = _userCredential.user;
      return _userFromUserCredential(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }*/

  // auth change user stream
  Stream<Users?> get user {
    return FirebaseAuth.instance.authStateChanges().map(_userFromUserCredential);
  }
  //sign in with email and password
  Future<Users?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = _userCredential.user;
      return _userFromUserCredential(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  //regiter with email & password
  Future<Users?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential _userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = _userCredential.user;

      await DatabaseService(uid: user!.uid).updateUserData(_userFromUserCredential(user));

      return _userFromUserCredential(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}

/*
Future<User?> signin (String email,String password)async{
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try{
    UserCredential userCredential = await FirebaseAuth.instance.
    signInWithEmailAndPassword(email: email, password: password);
    print('Success Log In');
    user = userCredential.user;
  } on FirebaseAuthException catch(e){
    if(e.code == 'user-not-found'){
      print('No user found for that email');
    }else if(e.code == 'wrong-password'){
      print('Wrong password provided for that user');
    }
  }
}*/
