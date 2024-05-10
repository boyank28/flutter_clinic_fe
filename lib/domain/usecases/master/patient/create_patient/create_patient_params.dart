class CreatePatientParams {
  final String nik;
  final String noKk;
  final String name;
  final String phone;
  final String? email;
  final String gender;
  final String birthPlace;
  final DateTime birthDate;
  final String addressLine;
  final String city;
  final String cityCode;
  final String province;
  final String provinceCode;
  final String district;
  final String districtCode;
  final String village;
  final String villageCode;
  final String rt;
  final String rw;
  final String postalCode;
  final String maritalStatus;
  final String? relationshipName;
  final String? relationshipPhone;
  final int isDeceased;

  CreatePatientParams({
    required this.nik,
    required this.noKk,
    required this.name,
    required this.phone,
    required this.email,
    required this.gender,
    required this.birthPlace,
    required this.birthDate,
    required this.addressLine,
    required this.city,
    required this.cityCode,
    required this.province,
    required this.provinceCode,
    required this.district,
    required this.districtCode,
    required this.village,
    required this.villageCode,
    required this.rt,
    required this.rw,
    required this.postalCode,
    required this.maritalStatus,
    required this.relationshipName,
    required this.relationshipPhone,
    required this.isDeceased,
  });
}
