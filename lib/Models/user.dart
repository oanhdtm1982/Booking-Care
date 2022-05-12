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

  Users(
      this.uid,
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
  String getuid() {
    return this.uid;
  }
}