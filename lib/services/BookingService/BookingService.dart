import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanchuyennganh/Models/Speciality.dart';

import '../../Models/Booking.dart';

class BookingService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Booking>> retrieveBookingData() async{
    QuerySnapshot<Map<String,dynamic>> snapshot =
        await _firestore.collection('booking').get();
    return snapshot.docs
        .map((docSnapshot) => Booking.fromDocumentSnapshot(docSnapshot)).toList();
  }
  Future<List<Speciality>> retrieveSpecialityData() async{
    QuerySnapshot<Map<String,dynamic>> snapshot =
    await _firestore.collection('specialty').get();
    return snapshot.docs
        .map((docSnapshot) => Speciality.fromDocumentSnapshot(docSnapshot)).toList();
  }
}