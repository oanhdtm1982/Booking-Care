import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String uid;
  String name;
  String email;
  String password;
  String roleid;
  String address;
  String phone;
  String avatar;
  String gender;
  String description;
  String isactive;
  String createat;
  String deleteat;

  Users(this.uid,
      this.name,
      this.email,
      this.password,
      this.roleid,
      this.address,
      this.phone,
      this.avatar,
      this.gender,
      this.description,
      this.isactive,
      this.createat,
      this.deleteat);

  /*Users(String _uid, String _name, String _email, String _password, String _roleid, String _address, String _phone, String _avatar, String _gender, String _description, String _isactive, String _createat, String _deleteat) {
    this.uid = _uid;
    this.email = _email;
    this.password = _password;
    this.roleid = _roleid;
    this.address = _address;
    this.phone = _phone;
    this.avatar = _avatar;
    this.gender = _gender;
    this.description = _description;
    this.isactive = _isactive;
    this.createat = _createat;
    this.deleteat = _deleteat;
  }*/
  String getuid() {
    return this.uid;
  }

  String getname() {
    return this.name;
  }

  String getemail() {
    return this.email;
  }

  String getpassword() {
    return this.password;
  }

  String getaddress() {
    return this.address;
  }

  String getphone() {
    return this.phone;
  }

  String getroleid() {
    return this.roleid;
  }

  String getavatar() {
    return this.avatar;
  }

  String getgender() {
    return this.gender;
  }

  String getdescription() {
    return this.description;
  }

  String getisactive() {
    return this.isactive;
  }

  String getcreateat() {
    return this.createat;
  }

  String getdedeleteat() {
    return this.deleteat;
  }
}