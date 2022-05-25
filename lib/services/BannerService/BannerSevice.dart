import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/Banner.dart';

class BannerService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Banner_Model>> retrieveBannerData() async{
    QuerySnapshot<Map<String,dynamic>> snapshot =
        await _firestore.collection('banner').get();
    return snapshot.docs
        .map((docSnapshot) => Banner_Model.fromDocumentSnapshot(docSnapshot)).toList();
  }
}