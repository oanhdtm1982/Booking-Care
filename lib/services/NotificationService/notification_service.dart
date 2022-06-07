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
  Future<void> addNotificationData(NotificationModel notification) {
    return _firestore.collection('notification').add(notification.toEntity().toJson());
  }
  Future<void> updateNotificationConfirm(NotificationModel notification) async{
    QuerySnapshot<Map<String,dynamic>> snapshot =
        await _firestore.collection('notification').where("confirm", isEqualTo: false).where("email",isEqualTo: notification.email).where("id",isEqualTo: "1").get();
    return snapshot.docs.forEach((element) { 
      element.reference.update({"confirm": true});
    });
  }
}