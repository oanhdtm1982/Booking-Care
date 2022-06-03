import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final String name;
  final String email;
  final String spec_name;
  final String docID;
  Doctor({
    required this.name,
    required this.email,
    required this.spec_name,
    required this.docID,
  });
  List<Object> get props => [name, email, spec_name, docID];
  factory Doctor.fromJson(Map<String, dynamic> json) {
    Doctor email = Doctor(
      name: json["name"],
      spec_name: json["toEmail"],
      email: json["email"],
      docID: json["docID"],
    );
    return email;
  }
  Doctor toEntity() =>
      Doctor(name: name, email: email, spec_name: spec_name, docID: docID);
  Map<String, dynamic> toJson() => {
        'name': this.name,
        'email': this.email,
        'subject': this.spec_name,
        'docID': this.docID,
      };
  Doctor.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
        email = doc.data()!["email"],
        docID = doc.data()!["docID"],
        spec_name = doc.data()!["spec_name"];
}
