// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'payment.g.dart';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

@JsonSerializable()
class Payment {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "patient_reservation")
  PatientReservation patientReservation;
  @JsonKey(name: "payment_method")
  String paymentMethod;
  @JsonKey(name: "total_price")
  int totalPrice;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;

  Payment({
    required this.id,
    required this.patientReservation,
    required this.paymentMethod,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}

@JsonSerializable()
class PatientReservation {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "patient")
  Patient patient;
  @JsonKey(name: "doctor")
  Doctor doctor;
  @JsonKey(name: "schedule_time")
  String scheduleTime;
  @JsonKey(name: "complaint")
  String complaint;
  @JsonKey(name: "queue_number")
  int queueNumber;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "payment_method")
  String paymentMethod;
  @JsonKey(name: "total_price")
  int totalPrice;
  @JsonKey(name: "created_at")
  String createdAt;

  PatientReservation({
    required this.id,
    required this.patient,
    required this.doctor,
    required this.scheduleTime,
    required this.complaint,
    required this.queueNumber,
    required this.status,
    required this.paymentMethod,
    required this.totalPrice,
    required this.createdAt,
  });

  factory PatientReservation.fromJson(Map<String, dynamic> json) => _$PatientReservationFromJson(json);

  Map<String, dynamic> toJson() => _$PatientReservationToJson(this);
}

@JsonSerializable()
class Doctor {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "id_ihs")
  String idIhs;
  @JsonKey(name: "nik")
  String nik;
  @JsonKey(name: "sip")
  String sip;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "specialization")
  String specialization;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "photo")
  String photo;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "created_at")
  String createdAt;

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

@JsonSerializable()
class Patient {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "nik")
  String nik;
  @JsonKey(name: "no_kk")
  String noKk;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "birth_place")
  String birthPlace;
  @JsonKey(name: "birth_date")
  DateTime birthDate;
  @JsonKey(name: "address_line")
  String addressLine;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "city_code")
  String cityCode;
  @JsonKey(name: "province")
  String province;
  @JsonKey(name: "province_code")
  String provinceCode;
  @JsonKey(name: "district")
  String district;
  @JsonKey(name: "district_code")
  String districtCode;
  @JsonKey(name: "village")
  String village;
  @JsonKey(name: "village_code")
  String villageCode;
  @JsonKey(name: "rt")
  String rt;
  @JsonKey(name: "rw")
  String rw;
  @JsonKey(name: "postal_code")
  String postalCode;
  @JsonKey(name: "marital_status")
  String maritalStatus;
  @JsonKey(name: "relationship_name")
  dynamic relationshipName;
  @JsonKey(name: "relationship_phone")
  dynamic relationshipPhone;
  @JsonKey(name: "is_deceased")
  int isDeceased;
  @JsonKey(name: "created_at")
  String createdAt;

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
