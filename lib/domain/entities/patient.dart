// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'patient.g.dart';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

@JsonSerializable()
class Patient {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "nik")
  final String nik;
  @JsonKey(name: "no_kk")
  final String noKk;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String gender;
  @JsonKey(name: "birth_place")
  final String birthPlace;
  @JsonKey(name: "birth_date")
  final DateTime birthDate;
  @JsonKey(name: "address_line")
  final String addressLine;
  @JsonKey(name: "city")
  final String city;
  @JsonKey(name: "city_code")
  final String cityCode;
  @JsonKey(name: "province")
  final String province;
  @JsonKey(name: "province_code")
  final String provinceCode;
  @JsonKey(name: "district")
  final String district;
  @JsonKey(name: "district_code")
  final String districtCode;
  @JsonKey(name: "village")
  final String village;
  @JsonKey(name: "village_code")
  final String villageCode;
  @JsonKey(name: "rt")
  final String rt;
  @JsonKey(name: "rw")
  final String rw;
  @JsonKey(name: "postal_code")
  final String postalCode;
  @JsonKey(name: "marital_status")
  final String maritalStatus;
  @JsonKey(name: "relationship_name")
  final String? relationshipName;
  @JsonKey(name: "relationship_phone")
  final String? relationshipPhone;
  @JsonKey(name: "is_deceased")
  final int isDeceased;
  @JsonKey(name: "created_at")
  final String createdAt;

  Patient({
    required this.id,
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
    required this.createdAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
