import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String title;
  final String description;
  bool confirm;
  final String docID;
  final String email;
  final String id;
  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.confirm,
    required this.docID,
    required this.email,
  });
  List<Object> get props => [title, description, confirm, docID];
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    NotificationModel description = NotificationModel(
      title: json["title"],
      id: json["id"],
      confirm: json["confirm"],
      description: json["description"],
      docID: json["docID"],
      email: json["email"],
    );
    return description;
  }
  NotificationModel toEntity() =>
      NotificationModel(id:id,email:email,title: title, description: description, confirm: confirm, docID: docID);
  Map<String, dynamic> toJson() => {
        'title': this.title,
        'id': this.id,
        'description': this.description,
        'confirm': this.confirm,
        'docID': this.docID,
        'email': this.email,
      };
  NotificationModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : title = doc.data()!["title"],
        id = doc.data()!["id"],
        description = doc.data()!["description"],
        docID = doc.data()!["docID"],
        email = doc.data()!["email"],
        confirm = doc.data()!["confirm"];
}