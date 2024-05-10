// To parse this JSON data, do
//
//     final doctorSchedule = doctorScheduleFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'doctor.dart';

part 'doctor_schedule.g.dart';

DoctorSchedule doctorScheduleFromJson(String str) => DoctorSchedule.fromJson(json.decode(str));

String doctorScheduleToJson(DoctorSchedule data) => json.encode(data.toJson());

@JsonSerializable()
class DoctorSchedule {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "doctor")
  final Doctor doctor;
  @JsonKey(name: "day")
  final String day;
  @JsonKey(name: "start")
  final String start;
  @JsonKey(name: "end")
  final String end;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "note")
  final String? note;
  @JsonKey(name: "created_at")
  final String createdAt;

  DoctorSchedule({
    required this.id,
    required this.doctor,
    required this.day,
    required this.start,
    required this.end,
    required this.status,
    required this.note,
    required this.createdAt,
  });

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) => _$DoctorScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorScheduleToJson(this);
}
