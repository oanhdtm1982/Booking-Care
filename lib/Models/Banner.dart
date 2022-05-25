import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Banner_Model extends Equatable{
  final String path;
  final String image;
  Banner_Model({
    required this.path,
    required this.image,
  });
  @override
  List<Object?>get props => [path,image];
  static Banner_Model fromJson(Map<String,dynamic> json){
    Banner_Model booking = Banner_Model(
      path:  json["path"],
      image: json["image"],
    );
    return booking;
  }
  Banner_Model.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
  :     path = doc.data()!["path"],
        image = doc.data()!["image"];
}
// List<Banner_Model> banner_raw = [
//   Banner_Model(
//       path: "https://www.google.com",
//       image: "https://www.unicef.org/vietnam/sites/unicef.org.vietnam/files/styles/hero_desktop/public/home-treatment-hero-image.jpg?itok=MT1Qjgt0"
//   ),
//   Banner_Model(
//       path: "https://www.unicef.org/vietnam/vi/nh%E1%BB%AFng-c%C3%A2u-chuy%E1%BB%87n/cha-m%E1%BA%B9-c%E1%BA%A7n-bi%E1%BA%BFt-g%C3%AC-v%E1%BB%81-h%E1%BA%ADu-covid-19-%E1%BB%9F-tr%E1%BA%BB-em",
//       image: "https://www.unicef.org/vietnam/sites/unicef.org.vietnam/files/styles/hero_desktop/public/children-vaccine-2_0.jpg?itok=KTqOTfTd"
//   ),
//   Banner_Model(
//       path: "https://www.unicef.org/vietnam/vi/nh%E1%BB%AFng-c%C3%A2u-chuy%E1%BB%87n/cha-m%E1%BA%B9-c%C3%B3-bi%E1%BA%BFt-v%E1%BA%AFc-xin-ph%C3%B2ng-covid-19-cho-tr%E1%BA%BB-em-%C4%91%C6%B0%E1%BB%A3c-nghi%C3%AAn-c%E1%BB%A9u-th%E1%BB%AD-nghi%E1%BB%87m-v%C3%A0-ch%E1%BA%BF",
//       image: "https://www.unicef.org/vietnam/sites/unicef.org.vietnam/files/styles/hero_desktop/public/children-vaccine-2_0.jpg?itok=KTqOTfTd"
//   ),
//   Banner_Model(
//       path: "https://www.unicef.org/vietnam/vi/nh%E1%BB%AFng-c%C3%A2u-chuy%E1%BB%87n/ch%C3%BAng-ta-hi%E1%BB%83u-g%C3%AC-v%E1%BB%81-bi%E1%BA%BFn-th%E1%BB%83-omicron",
//       image: "https://www.unicef.org/vietnam/sites/unicef.org.vietnam/files/styles/hero_desktop/public/children-vaccine-2_0.jpg?itok=KTqOTfTd"
//   )
// ];