import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String title;
  final String description;
  bool confirm;
  final String docID;
  final String email;
  NotificationModel({
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
      confirm: json["confirm"],
      description: json["description"],
      docID: json["docID"],
      email: json["email"],
    );
    return description;
  }
  NotificationModel toEntity() =>
      NotificationModel(email:email,title: title, description: description, confirm: confirm, docID: docID);
  Map<String, dynamic> toJson() => {
        'title': this.title,
        'description': this.description,
        'confirm': this.confirm,
        'docID': this.docID,
        'email': this.email,
      };
  NotificationModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : title = doc.data()!["title"],
        description = doc.data()!["description"],
        docID = doc.data()!["docID"],
        email = doc.data()!["email"],
        confirm = doc.data()!["confirm"];
}
List<NotificationModel> list_noti_raw = [
  NotificationModel(title: "Sending schedule time", description: "Schedule time: 9.00 Am - 14-09-2012", confirm: false, docID: "BS213", email: "kudung052@gmail.com"),
  NotificationModel(title: "Sending schedule time", description: "Schedule time: 2.00 Am - 14-09-2012", confirm: false, docID: "BS213", email: "test1@gmail.com"),
  NotificationModel(title: "Sending schedule time", description: "Schedule time: 3.00 Am - 14-09-2012", confirm: false, docID: "BS213", email: "test2@gmail.com"),
  NotificationModel(title: "Sending schedule time", description: "Schedule time: 4.00 Am - 14-09-2012", confirm: false, docID: "BS213", email: "test3@gmail.com"),
];