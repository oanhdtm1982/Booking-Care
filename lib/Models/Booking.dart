import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Booking extends Equatable{
  final String phone;
  final String id;
  final String name;
  final String gender;
  Booking({
    required this.phone,
    required this.id,
    required this.name,
    required this.gender
});
  @override
  List<Object?>get props => [id,phone,name,gender];
  static Booking fromJson(Map<String,dynamic> json){
    Booking booking = Booking(
      id: json["id"],
      phone:  json["phone"],
      name: json["name"],
      gender: json["gender"],
    );
    return booking;
  }
  Booking.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
    : id = doc.data()!["id"],
  phone = doc.data()!["phone"],
  name = doc.data()!["name"],
  gender = doc.data()!["gender"];
}
List<Booking> list_booking_raw = [
  Booking(phone: "0335240370", id: "001", name: "Dung", gender: "Male"),
  Booking(phone: "0123456789", id: "002", name: "Messi", gender: "Male"),
  Booking(phone: "0983123121", id: "003", name: "Ronaldo", gender: "Male"),
  Booking(phone: "0982131212", id: "004", name: "Oanh", gender: "Female"),
];
List<String> title = [
  "ID","Name",""
];