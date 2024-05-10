// To parse this JSON data, do
//
//     final medicalRecord = medicalRecordFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'medical_record_service.dart';
import 'patient_reservation.dart';

part 'medical_record.g.dart';

MedicalRecord medicalRecordFromJson(String str) => MedicalRecord.fromJson(json.decode(str));

String medicalRecordToJson(MedicalRecord data) => json.encode(data.toJson());

@JsonSerializable()
class MedicalRecord {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "patient_reservation")
  final PatientReservation patientReservation;
  @JsonKey(name: "diagnosis")
  final String diagnosis;
  @JsonKey(name: "medical_treatment")
  final String medicalTreatment;
  @JsonKey(name: "doctor_notes")
  final String doctorNotes;
  @JsonKey(name: "medical_record_services")
  final List<MedicalRecordService> medicalRecordServices;
  @JsonKey(name: "created_at")
  final String createdAt;

  MedicalRecord({
    required this.id,
    required this.patientReservation,
    required this.diagnosis,
    required this.medicalTreatment,
    required this.doctorNotes,
    required this.medicalRecordServices,
    required this.createdAt,
  });

  factory MedicalRecord.fromJson(Map<String, dynamic> json) => _$MedicalRecordFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalRecordToJson(this);
}
