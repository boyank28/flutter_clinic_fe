// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorSchedule _$DoctorScheduleFromJson(Map<String, dynamic> json) =>
    DoctorSchedule(
      id: json['id'] as int,
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      day: json['day'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
      status: json['status'] as String,
      note: json['note'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$DoctorScheduleToJson(DoctorSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'day': instance.day,
      'start': instance.start,
      'end': instance.end,
      'status': instance.status,
      'note': instance.note,
      'created_at': instance.createdAt,
    };
