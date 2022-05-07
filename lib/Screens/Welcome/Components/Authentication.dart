import 'package:firebase_auth/firebase_auth.dart';

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
}