import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Speciality extends Equatable{
  final String spec_name;
  final String id;
  final List<String> list_doctors;
  Speciality({
    required this.id,
    required this.spec_name,
    required this.list_doctors
  });
  @override
  List<Object?>get props => [spec_name,list_doctors];
  static Speciality fromJson(Map<String,dynamic> json){
    Speciality booking = Speciality(
      id: json["id"],
      spec_name: json["spec_name"],
      list_doctors: List.from(json["list_doctors"]),
    );
    return booking;
  }
  Speciality.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
    : spec_name = doc.data()!["spec_name"],
      id = doc.data()!["id"],
      list_doctors = List.from(doc.data()!["list_doctors"]);
}