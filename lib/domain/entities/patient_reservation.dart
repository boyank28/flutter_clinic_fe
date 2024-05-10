// To parse this JSON data, do
//
//     final patientReservation = patientReservationFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'doctor.dart';
import 'patient.dart';

part 'patient_reservation.g.dart';

PatientReservation patientReservationFromJson(String str) => PatientReservation.fromJson(json.decode(str));

String patientReservationToJson(PatientReservation data) => json.encode(data.toJson());

@JsonSerializable()
class PatientReservation {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "patient")
  final Patient patient;
  @JsonKey(name: "doctor")
  final Doctor doctor;
  @JsonKey(name: "schedule_time")
  final String scheduleTime;
  @JsonKey(name: "complaint")
  final String complaint;
  @JsonKey(name: "queue_number")
  final int queueNumber;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "payment_method")
  final String? paymentMethod;
  @JsonKey(name: "total_price")
  final int? totalPrice;
  @JsonKey(name: 'created_at')
  final String createdAt;

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
