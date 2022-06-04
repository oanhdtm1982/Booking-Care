import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanchuyennganh/Models/Notification.dart';

import '../../Models/Banner.dart';

class NotificationService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<NotificationModel>> retrieveNotificationData() async{
    QuerySnapshot<Map<String,dynamic>> snapshot =
        await _firestore.collection('notification').get();
    return snapshot.docs
        .map((docSnapshot) => NotificationModel.fromDocumentSnapshot(docSnapshot)).toList();
  }
}