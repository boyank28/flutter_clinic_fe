// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientReservation _$PatientReservationFromJson(Map<String, dynamic> json) =>
    PatientReservation(
      id: json['id'] as int,
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      scheduleTime: json['schedule_time'] as String,
      complaint: json['complaint'] as String,
      queueNumber: json['queue_number'] as int,
      status: json['status'] as String,
      paymentMethod: json['payment_method'] as String?,
      totalPrice: json['total_price'] as int?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$PatientReservationToJson(PatientReservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient': instance.patient,
      'doctor': instance.doctor,
      'schedule_time': instance.scheduleTime,
      'complaint': instance.complaint,
      'queue_number': instance.queueNumber,
      'status': instance.status,
      'payment_method': instance.paymentMethod,
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt,
    };
