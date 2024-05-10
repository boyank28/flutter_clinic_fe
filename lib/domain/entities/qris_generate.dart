// To parse this JSON data, do
//
//     final qrisGenerate = qrisGenerateFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'qris_generate.g.dart';

QrisGenerate qrisGenerateFromJson(String str) => QrisGenerate.fromJson(json.decode(str));

String qrisGenerateToJson(QrisGenerate data) => json.encode(data.toJson());

@JsonSerializable()
class QrisGenerate {
  @JsonKey(name: "status_code")
  String statusCode;
  @JsonKey(name: "status_message")
  String statusMessage;
  @JsonKey(name: "transaction_id")
  String transactionId;
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "merchant_id")
  String merchantId;
  @JsonKey(name: "gross_amount")
  String grossAmount;
  @JsonKey(name: "currency")
  String currency;
  @JsonKey(name: "payment_type")
  String paymentType;
  @JsonKey(name: "transaction_time")
  String transactionTime;
  @JsonKey(name: "transaction_status")
  String transactionStatus;
  @JsonKey(name: "fraud_status")
  String fraudStatus;
  @JsonKey(name: "actions")
  List<Action> actions;
  @JsonKey(name: "qr_string")
  String qrString;
  @JsonKey(name: "acquirer")
  String acquirer;

  QrisGenerate({
    required this.statusCode,
    required this.statusMessage,
    required this.transactionId,
    required this.orderId,
    required this.merchantId,
    required this.grossAmount,
    required this.currency,
    required this.paymentType,
    required this.transactionTime,
    required this.transactionStatus,
    required this.fraudStatus,
    required this.actions,
    required this.qrString,
    required this.acquirer,
  });

  QrisGenerate copyWith({
    String? statusCode,
    String? statusMessage,
    String? transactionId,
    String? orderId,
    String? merchantId,
    String? grossAmount,
    String? currency,
    String? paymentType,
    String? transactionTime,
    String? transactionStatus,
    String? fraudStatus,
    List<Action>? actions,
    String? qrString,
    String? acquirer,
  }) =>
      QrisGenerate(
        statusCode: statusCode ?? this.statusCode,
        statusMessage: statusMessage ?? this.statusMessage,
        transactionId: transactionId ?? this.transactionId,
        orderId: orderId ?? this.orderId,
        merchantId: merchantId ?? this.merchantId,
        grossAmount: grossAmount ?? this.grossAmount,
        currency: currency ?? this.currency,
        paymentType: paymentType ?? this.paymentType,
        transactionTime: transactionTime ?? this.transactionTime,
        transactionStatus: transactionStatus ?? this.transactionStatus,
        fraudStatus: fraudStatus ?? this.fraudStatus,
        actions: actions ?? this.actions,
        qrString: qrString ?? this.qrString,
        acquirer: acquirer ?? this.acquirer,
      );

  factory QrisGenerate.fromJson(Map<String, dynamic> json) => _$QrisGenerateFromJson(json);

  Map<String, dynamic> toJson() => _$QrisGenerateToJson(this);
}

@JsonSerializable()
class Action {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "method")
  String method;
  @JsonKey(name: "url")
  String url;

  Action({
    required this.name,
    required this.method,
    required this.url,
  });

  Action copyWith({
    String? name,
    String? method,
    String? url,
  }) =>
      Action(
        name: name ?? this.name,
        method: method ?? this.method,
        url: url ?? this.url,
      );

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);
}
