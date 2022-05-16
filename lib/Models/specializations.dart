class Specializations {
  String specializationid;
  String name;
  String createat;
  String deleteat;

  Specializations(
      this.specializationid, this.name, this.createat, this.deleteat);

  String getspecializationid() {
    return this.specializationid;
  }
  String getname(){
    return this.name;
  }
  String getcreateat() {
    return this.createat;
  }
  String getdeleteat(){
    return this.deleteat;
  }
}