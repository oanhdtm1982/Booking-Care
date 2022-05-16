import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});


  // collection references
  final CollectionReference appCollection = FirebaseFirestore.instance.collection('user');

  Future updateUserData(Users? user) async{
    return await appCollection.doc(uid).set({
      'name': user!.name,
      'email':user.email,
      'password':user.password,
      'roleid': user.roleid,
      'address':user.address,
      'phone':user.phone,
      'avatar':user.avatar,
      'gender':user.gender,
      'description':user.description,
      'isactive':user.isactive,
      'createat':user.createat,
      'deleteat':user.deleteat,
    });
  }
  Stream<QuerySnapshot> get user {
    return app
  }
}