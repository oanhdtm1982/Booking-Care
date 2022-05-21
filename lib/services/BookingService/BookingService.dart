import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/Booking.dart';

class BookingService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Booking>> retrieveBookingData() async{
    QuerySnapshot<Map<String,dynamic>> snapshot =
        await _firestore.collection('booking').get();
    return snapshot.docs
        .map((docSnapshot) => Booking.fromDocumentSnapshot(docSnapshot)).toList();
  }
}