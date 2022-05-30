import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanchuyennganh/Models/BookingRegister.dart';
import 'package:equatable/equatable.dart';

class Booking extends Equatable{
  final String phone;
  final String id;
  final String name;
  final String gender;
  final Timestamp birthday;
  final String email;
  Booking({
    required this.phone,
    required this.id,
    required this.name,
    required this.gender,
    required this.birthday,
    required this.email,
});
  @override
  List<Object?>get props => [id,phone,name,gender,birthday];
  static Booking fromJson(Map<String,dynamic> json){
    Booking booking = Booking(
      email : json["email"],
      birthday: json["birthday"],
      id: json["id"],
      phone:  json["phone"],
      name: json["name"],
      gender: json["gender"],
    );
    return booking;
  }
  Booking.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
    : id = doc.data()!["id"],
  email = doc.data()!["email"],
  phone = doc.data()!["phone"],
  name = doc.data()!["name"],
  birthday = doc.data()!["birthday"],
  gender = doc.data()!["gender"];
}