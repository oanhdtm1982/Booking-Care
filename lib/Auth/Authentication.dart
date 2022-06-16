import 'package:doanchuyennganh/Service/Database.dart';
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
  Future<Users?> signInAnon() async {
    try {
      UserCredential _userCredential = await _auth.signInAnonymously();
      User? user = _userCredential.user;
      return _userFromUserCredential(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  Future<Users?> signInWithEmailAndPassword(String _email, String _password) async {
    try {
      UserCredential resutl = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      User? user = resutl.user;
      return _userFromUserCredential(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //regiter with email & password
  Future<Users?> registerAccount(String _name, String _email, String _password, String _gender, String _phoneNumber) async {
    try {
      UserCredential resutl = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
      User? user = resutl.user;
      await DatabaseService(uid: user!.uid, doctor_userid: "", clinicid: "", statusid: "", roleid: "", specializationid: "").updateUserData("0", _name, _email, _password, "", "", _phoneNumber, "", _gender, "", "", "", "");
      return _userFromUserCredential(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // auth user change stream

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
