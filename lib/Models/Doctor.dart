import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Doctor extends Equatable{
  final String name;
  final String email;
  final String spec_name;
  Doctor({
    required this.name,
    required this.email,
    required this.spec_name,
  });
  List<Object> get props => [name,email,spec_name];
  factory Doctor.fromJson(Map<String,dynamic> json){
    Doctor email = Doctor(
      name : json["name"],
      spec_name: json["toEmail"],
      email: json["email"],
    );
    return email;
  }
  Doctor toEntity() =>  Doctor(name: name, email: email,spec_name: spec_name);
  Map<String,dynamic> toJson() => {
    'name' : this.name,
    'email': this.email,
    'subject': this.spec_name,
  };
  Doctor.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
      : name = doc.data()!["name"],
        email = doc.data()!["email"],
        spec_name = doc.data()!["spec_name"];
}