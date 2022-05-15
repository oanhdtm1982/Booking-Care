import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('user');

  final String uid;
  DatabaseService({required this.uid});

  Future updateUserData(String _uid, String _name, String _email, String _password, String _roleid, String _address, String _phone, String _avatar, String _gender, String _description, String _isactive, String _createat, String _deleteat)  async{
      return await collectionReference.doc(uid).set({
        'name': _name,
        'email': _email,
        'password': _password,
        'roleid': _roleid,
        'address': _address,
        'phone': _phone,
        'avatar': _avatar,
        'gender': _gender,
        'descripiton': _description,
        'isactive': _isactive,
        'createat': _createat,
        'deleteat': _deleteat,
      });
  }
}