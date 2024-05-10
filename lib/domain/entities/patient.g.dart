// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: json['id'] as int,
      nik: json['nik'] as String,
      noKk: json['no_kk'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      gender: json['gender'] as String,
      birthPlace: json['birth_place'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      addressLine: json['address_line'] as String,
      city: json['city'] as String,
      cityCode: json['city_code'] as String,
      province: json['province'] as String,
      provinceCode: json['province_code'] as String,
      district: json['district'] as String,
      districtCode: json['district_code'] as String,
      village: json['village'] as String,
      villageCode: json['village_code'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      postalCode: json['postal_code'] as String,
      maritalStatus: json['marital_status'] as String,
      relationshipName: json['relationship_name'] as String?,
      relationshipPhone: json['relationship_phone'] as String?,
      isDeceased: json['is_deceased'] as int,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'no_kk': instance.noKk,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'birth_place': instance.birthPlace,
      'birth_date': instance.birthDate.toIso8601String(),
      'address_line': instance.addressLine,
      'city': instance.city,
      'city_code': instance.cityCode,
      'province': instance.province,
      'province_code': instance.provinceCode,
      'district': instance.district,
      'district_code': instance.districtCode,
      'village': instance.village,
      'village_code': instance.villageCode,
      'rt': instance.rt,
      'rw': instance.rw,
      'postal_code': instance.postalCode,
      'marital_status': instance.maritalStatus,
      'relationship_name': instance.relationshipName,
      'relationship_phone': instance.relationshipPhone,
      'is_deceased': instance.isDeceased,
      'created_at': instance.createdAt,
    };
