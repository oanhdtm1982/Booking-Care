
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Email extends Equatable{
  final String name;
  final String email;
  final String subject;
  final String message;
  final String toName;
  final String toEmail;
  Email({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
    required this.toName,
    required this.toEmail,
});
  List<Object> get props => [name,email,subject,message];
  factory Email.fromJson(Map<String,dynamic> json){
    Email email = Email(
      name : json["name"],
      toEmail: json["toEmail"],
      email: json["email"],
      subject: json["subject"],
      message:  json["message"],
      toName:  json["toName"],
    );
    return email;
  }
  Email toEntity() =>  Email(name: name, email: email, subject: subject, message: message,toName:toName,toEmail: toEmail);
  Map<String,dynamic> toJson() => {
    'name' : this.name,
    'date': this.email,
    'toEmail': this.toEmail,
    'subject': this.subject,
    'message': this.message,
    'toName': this.toName,
  };
  Email.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
      : name = doc.data()!["name"],
        email = doc.data()!["email"],
        subject = doc.data()!["subject"],
        toName = doc.data()!["toName"],
        toEmail = doc.data()!["toEmail"],
        message = doc.data()!["message"];

}