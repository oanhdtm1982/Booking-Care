import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  final String phone;
  final String id;
  final String name;
  final String gender;
  final Timestamp birthday;
  final String email;
  final String imagePath;
  Booking({
    required this.phone,
    required this.id,
    required this.name,
    required this.gender,
    required this.birthday,
    required this.imagePath,
    required this.email,
  });
  @override
  List<Object?> get props => [id, phone, name, gender, birthday, imagePath];
  static Booking fromJson(Map<String, dynamic> json) {
    Booking booking = Booking(
      imagePath: json["imagePath"],
      email: json["email"],
      birthday: json["birthday"],
      id: json["id"],
      phone: json["phone"],
      name: json["name"],
      gender: json["gender"],
    );
    return booking;
  }

  Booking toEntity() => Booking(
      id: id,
      phone: phone,
      name: name,
      gender: gender,
      birthday: birthday,
      imagePath: imagePath,
      email: email);
  Map<String, dynamic> toJson() => {
        'id': this.id,
        'phone': this.phone,
        'name': this.name,
        'gender': this.gender,
        'birthday': this.birthday,
        'imagePath': this.imagePath,
        'email': this.email,
      };
  Booking.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.data()!["id"],
        email = doc.data()!["email"],
        phone = doc.data()!["phone"],
        name = doc.data()!["name"],
        imagePath = doc.data()!["imagePath"],
        birthday = doc.data()!["birthday"],
        gender = doc.data()!["gender"];
}
