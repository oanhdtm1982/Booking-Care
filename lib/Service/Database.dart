import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('user');
  final CollectionReference userDoctorCollection = FirebaseFirestore.instance.collection('doctor_user');
  final CollectionReference clinicCollection = FirebaseFirestore.instance.collection('clinics');
  final CollectionReference statusCollection = FirebaseFirestore.instance.collection('statuses');
  final CollectionReference roleCollection = FirebaseFirestore.instance.collection('roles');
  final CollectionReference specializationCollection = FirebaseFirestore.instance.collection('specializations');


  final String uid;
  final String doctor_userid;
  final String clinicid;
  final String statusid;
  final String roleid;
  final String specializationid;

  DatabaseService({
    required this.uid,
    required this.doctor_userid,
    required this.clinicid,
    required this.statusid,
    required this.roleid,
    required this.specializationid,
  });

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
  Future updateDoctorUserData(String userid, String clinicid, String specializationid, String createat, String deleteat) async {
    return await userDoctorCollection.doc(doctor_userid).set({
      'userid': userid,
      'clinicid': clinicid,
      'specializationid': specializationid,
      'creteat:': createat,
      'deleteat': deleteat,
    });

  }
//get user stream
  Stream<QuerySnapshot> get user {
    return collectionReference.snapshots();
  }
}