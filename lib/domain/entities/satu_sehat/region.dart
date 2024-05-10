// To parse this JSON data, do
//
//     final region = regionFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'region.g.dart';

Region regionFromJson(String str) => Region.fromJson(json.decode(str));

String regionToJson(Region data) => json.encode(data.toJson());

@JsonSerializable()
class Region {
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "parent_code")
  final String parentCode;
  @JsonKey(name: "bps_code")
  final String bpsCode;
  @JsonKey(name: "name")
  final String name;

  Region({
    required this.code,
    required this.parentCode,
    required this.bpsCode,
    required this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
