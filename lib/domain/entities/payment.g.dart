// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: json['id'] as int,
      patientReservation: PatientReservation.fromJson(
          json['patient_reservation'] as Map<String, dynamic>),
      paymentMethod: json['payment_method'] as String,
      totalPrice: json['total_price'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'patient_reservation': instance.patientReservation,
      'payment_method': instance.paymentMethod,
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

PatientReservation _$PatientReservationFromJson(Map<String, dynamic> json) =>
    PatientReservation(
      id: json['id'] as int,
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      scheduleTime: json['schedule_time'] as String,
      complaint: json['complaint'] as String,
      queueNumber: json['queue_number'] as int,
      status: json['status'] as String,
      paymentMethod: json['payment_method'] as String,
      totalPrice: json['total_price'] as int,
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

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: json['id'] as int,
      idIhs: json['id_ihs'] as String,
      nik: json['nik'] as String,
      sip: json['sip'] as String,
      name: json['name'] as String,
      specialization: json['specialization'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String,
      address: json['address'] as String,
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

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: json['id'] as int,
      nik: json['nik'] as String,
      noKk: json['no_kk'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
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
      relationshipName: json['relationship_name'],
      relationshipPhone: json['relationship_phone'],
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
