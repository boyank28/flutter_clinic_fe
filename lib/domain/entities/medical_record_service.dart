import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'clinic_service.dart';

part 'medical_record_service.g.dart';

MedicalRecordService medicalRecordServiceFromJson(String str) => MedicalRecordService.fromJson(json.decode(str));

String medicalRecordServiceToJson(MedicalRecordService data) => json.encode(data.toJson());

@JsonSerializable()
class MedicalRecordService {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "clinic_service")
  final ClinicService clinicService;
  @JsonKey(name: "qty")
  final int qty;

  MedicalRecordService({
    required this.id,
    required this.clinicService,
    required this.qty,
  });

  factory MedicalRecordService.fromJson(Map<String, dynamic> json) => _$MedicalRecordServiceFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalRecordServiceToJson(this);
}
