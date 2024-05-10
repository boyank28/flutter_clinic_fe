// To parse this JSON data, do
//
//     final clinicService = clinicServiceFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'clinic_service.g.dart';

ClinicService clinicServiceFromJson(String str) => ClinicService.fromJson(json.decode(str));

String clinicServiceToJson(ClinicService data) => json.encode(data.toJson());

@JsonSerializable()
class ClinicService {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "category")
  String category;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "qty")
  int qty;
  @JsonKey(name: "subtotal")
  int subtotal;
  @JsonKey(name: "is_checked")
  bool isChecked;
  @JsonKey(name: "created_at")
  String createdAt;

  ClinicService({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.qty,
    this.subtotal = 0,
    this.isChecked = false,
    required this.createdAt,
  });

  ClinicService copyWith({
    int? id,
    String? name,
    String? category,
    int? price,
    int? qty,
    int? subtotal,
    bool? isChecked,
    String? createdAt,
  }) =>
      ClinicService(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        price: price ?? this.price,
        qty: qty ?? this.qty,
        subtotal: subtotal ?? this.subtotal,
        isChecked: isChecked ?? this.isChecked,
        createdAt: createdAt ?? this.createdAt,
      );

  factory ClinicService.fromJson(Map<String, dynamic> json) => _$ClinicServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicServiceToJson(this);
}
