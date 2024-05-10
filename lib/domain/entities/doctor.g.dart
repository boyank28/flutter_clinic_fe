// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: json['id'] as int,
      idIhs: json['id_ihs'] as String?,
      nik: json['nik'] as String?,
      sip: json['sip'] as String,
      name: json['name'] as String,
      specialization: json['specialization'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String?,
      address: json['address'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'id_ihs': instance.idIhs,
      'nik': instance.nik,
      'sip': instance.sip,
      'name': instance.name,
      'specialization': instance.specialization,
      'phone': instance.phone,
      'email': instance.email,
      'photo': instance.photo,
      'address': instance.address,
      'created_at': instance.createdAt,
    };
