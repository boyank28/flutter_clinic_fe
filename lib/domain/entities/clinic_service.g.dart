// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicService _$ClinicServiceFromJson(Map<String, dynamic> json) =>
    ClinicService(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      price: json['price'] as int,
      qty: json['qty'] as int,
      subtotal: json['subtotal'] as int? ?? 0,
      isChecked: json['is_checked'] as bool? ?? false,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ClinicServiceToJson(ClinicService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'price': instance.price,
      'qty': instance.qty,
      'subtotal': instance.subtotal,
      'is_checked': instance.isChecked,
      'created_at': instance.createdAt,
    };
