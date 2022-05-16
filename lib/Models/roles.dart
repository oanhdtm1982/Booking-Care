class Roles {
  String roleid;
  String name;
  String createat;
  String deleteat;

  Roles(this.roleid, this.name, this.createat, this.deleteat);

  String getroleid() {
    return this.roleid;
  }
  String getname() {
    return this.name;
  }
  String getcreateat() {
    return this.createat;
  }
  String getdeleteat() {
    return this.deleteat;
  }
}