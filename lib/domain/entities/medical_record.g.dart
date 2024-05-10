// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) =>
    MedicalRecord(
      id: json['id'] as int,
      patientReservation: PatientReservation.fromJson(
          json['patient_reservation'] as Map<String, dynamic>),
      diagnosis: json['diagnosis'] as String,
      medicalTreatment: json['medical_treatment'] as String,
      doctorNotes: json['doctor_notes'] as String,
      medicalRecordServices: (json['medical_record_services'] as List<dynamic>)
          .map((e) => MedicalRecordService.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$MedicalRecordToJson(MedicalRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient_reservation': instance.patientReservation,
      'diagnosis': instance.diagnosis,
      'medical_treatment': instance.medicalTreatment,
      'doctor_notes': instance.doctorNotes,
      'medical_record_services': instance.medicalRecordServices,
      'created_at': instance.createdAt,
    };
