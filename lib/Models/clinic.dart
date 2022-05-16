class Clinics {
  String clinicid;
  String name;
  String createat;
  String deleteat;

  Clinics(this.clinicid, this.name, this.createat, this.deleteat);
  String getclinicid() {
    return this.clinicid;
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