// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'doctor.g.dart';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

@JsonSerializable()
class Doctor {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "id_ihs")
  final String? idIhs;
  @JsonKey(name: "nik")
  final String? nik;
  @JsonKey(name: "sip")
  final String sip;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "specialization")
  final String specialization;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "created_at")
  final String createdAt;

  Doctor({
    required this.id,
    required this.idIhs,
    required this.nik,
    required this.sip,
    required this.name,
    required this.specialization,
    required this.phone,
    required this.email,
    required this.photo,
    required this.address,
    required this.createdAt,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
