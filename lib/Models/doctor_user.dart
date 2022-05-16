class User_doctors {
  String doctorid;
  String userid;
  String clinicid;
  String specializationid;
  String createat;
  String deleteat;

  User_doctors(this.doctorid, this.userid, this.clinicid, this.specializationid,
      this.createat, this.deleteat);

  String getdoctorid() {
    return this.doctorid;
  }
  String getuserid() {
    return this.userid;
  }
  String getclinicid() {
    return this.clinicid;
  }
  String getspecializationid() {
    return this.specializationid;
  }
  String getcreateat() {
    return this.createat;
  }
  String getdeleteat() {
    return this.deleteat;
  }
}