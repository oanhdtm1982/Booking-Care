import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanchuyennganh/Models/BookingRegister.dart';
import 'package:doanchuyennganh/Models/Speciality.dart';

import '../../Models/Booking.dart';
import '../../Models/Doctor.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Booking>> retrieveBookingData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('booking').get();
    return snapshot.docs
        .map((docSnapshot) => Booking.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<Doctor>> retrieveDoctorData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('doctors').get();
    return snapshot.docs
        .map((docSnapshot) => Doctor.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<BookingRegister>> retrieveBookingRegData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('bookReg').get();
    return snapshot.docs
        .map((docSnapshot) => BookingRegister.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<Speciality>> retrieveSpecialityData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('specialty').get();
    return snapshot.docs
        .map((docSnapshot) => Speciality.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<void> addBookingRegData(BookingRegister bookReg) {
    return _firestore.collection('bookReg').add(bookReg.toEntity().toJson());
  }

  Future<void> addBookingUserData(Booking book) {
    return _firestore.collection('booking').add(book.toEntity().toJson());
  }
}
