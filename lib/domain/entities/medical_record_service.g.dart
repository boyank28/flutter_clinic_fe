// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordService _$MedicalRecordServiceFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordService(
      id: json['id'] as int,
      clinicService: ClinicService.fromJson(
          json['clinic_service'] as Map<String, dynamic>),
      qty: json['qty'] as int,
    );

Map<String, dynamic> _$MedicalRecordServiceToJson(
        MedicalRecordService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinic_service': instance.clinicService,
      'qty': instance.qty,
    };
