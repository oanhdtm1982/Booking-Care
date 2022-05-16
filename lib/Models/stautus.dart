class Status {
  String statusid;
  String name;
  String createat;
  String deleteat;

  Status(this.statusid, this.name, this.createat, this.deleteat);

  String getstatusid() {
    return this.statusid;
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