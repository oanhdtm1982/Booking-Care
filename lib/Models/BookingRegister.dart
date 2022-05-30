import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BookingRegister extends Equatable{
  final String id;
  final String date;
  final String time;
  final String spec;
  final String docName;
  BookingRegister({
    required this.id,
    required this.date,
    required this.time,
    required this.spec,
    required this.docName,
  });
  @override
  List<Object?>get props => [id,date,time,spec,docName];
  static BookingRegister fromJson(Map<String,dynamic> json){
    BookingRegister bookingRegister = BookingRegister(
      id : json["id"],
      date: json["date"],
      time: json["time"],
      spec:  json["spec"],
      docName: json["docName"],
    );
    return bookingRegister;
  }
  BookingRegister toEntity() =>  BookingRegister(id: id, date: date, time: time, spec: spec, docName: docName);
  Map<String,dynamic> toJson() => {
    'id' : this.id,
    'date': this.date,
    'time': this.time,
    'spec': this.spec,
    'docName': this.docName
  };
  BookingRegister.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
      : id = doc.data()!["id"],
        date = doc.data()!["date"],
        time = doc.data()!["time"],
        spec = doc.data()!["spec"],
        docName = doc.data()!["docName"];

}