// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      code: json['code'] as String,
      parentCode: json['parent_code'] as String,
      bpsCode: json['bps_code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'code': instance.code,
      'parent_code': instance.parentCode,
      'bps_code': instance.bpsCode,
      'name': instance.name,
    };
