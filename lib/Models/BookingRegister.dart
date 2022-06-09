import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BookingRegister extends Equatable{
  final String id;
  final String date;
  final String time;
  final String spec;
  final String docName;
  final String email;
  bool isConfirm;
  BookingRegister({
    required this.id,
    required this.date,
    required this.time,
    required this.spec,
    required this.docName,
    required this.isConfirm,
    required this.email,
  });
  @override
  List<Object?>get props => [id,date,time,spec,docName];
  static BookingRegister fromJson(Map<String,dynamic> json){
    BookingRegister bookingRegister = BookingRegister(
      id : json["id"],
      email: json["email"],
      date: json["date"],
      time: json["time"],
      spec:  json["spec"],
      docName: json["docName"],
      isConfirm: json["isConfirm"],
    );
    return bookingRegister;
  }
  BookingRegister toEntity() =>  BookingRegister(email:email,isConfirm:isConfirm,id: id, date: date, time: time, spec: spec, docName: docName);
  Map<String,dynamic> toJson() => {
    'id' : this.id,
    'date': this.date,
    'time': this.time,
    'spec': this.spec,
    'docName': this.docName,
    'isConfirm': this.isConfirm,
    'email': this.email,
  };
  BookingRegister.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
      : id = doc.data()!["id"],
        email = doc.data()!["email"],
        date = doc.data()!["date"],
        time = doc.data()!["time"],
        spec = doc.data()!["spec"],
        isConfirm = doc.data()!["isConfirm"],
        docName = doc.data()!["docName"];

}