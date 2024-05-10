// To parse this JSON data, do
//
//     final qrisCallback = qrisCallbackFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'qris_callback.g.dart';

QrisCallback qrisCallbackFromJson(String str) => QrisCallback.fromJson(json.decode(str));

String qrisCallbackToJson(QrisCallback data) => json.encode(data.toJson());

@JsonSerializable()
class QrisCallback {
  @JsonKey(name: "status_code")
  String statusCode;
  @JsonKey(name: "status_message")
  String statusMessage;
  @JsonKey(name: "transaction_id")
  String transactionId;
  @JsonKey(name: "masked_card")
  String? maskedCard;
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "payment_type")
  String paymentType;
  @JsonKey(name: "transaction_time")
  String transactionTime;
  @JsonKey(name: "transaction_status")
  String transactionStatus;
  @JsonKey(name: "fraud_status")
  String? fraudStatus;
  @JsonKey(name: "approval_code")
  String? approvalCode;
  @JsonKey(name: "signature_key")
  String? signatureKey;
  @JsonKey(name: "bank")
  String? bank;
  @JsonKey(name: "gross_amount")
  String grossAmount;
  @JsonKey(name: "channel_response_code")
  String? channelResponseCode;
  @JsonKey(name: "channel_response_message")
  String? channelResponseMessage;
  @JsonKey(name: "card_type")
  String? cardType;
  @JsonKey(name: "payment_option_type")
  String? paymentOptionType;
  @JsonKey(name: "shopeepay_reference_number")
  String? shopeepayReferenceNumber;
  @JsonKey(name: "reference_id")
  String? referenceId;

  QrisCallback({
    required this.statusCode,
    required this.statusMessage,
    required this.transactionId,
    this.maskedCard,
    required this.orderId,
    required this.paymentType,
    required this.transactionTime,
    required this.transactionStatus,
    this.fraudStatus,
    this.approvalCode,
    this.signatureKey,
    this.bank,
    required this.grossAmount,
    this.channelResponseCode,
    this.channelResponseMessage,
    this.cardType,
    this.paymentOptionType,
    this.shopeepayReferenceNumber,
    this.referenceId,
  });

  QrisCallback copyWith({
    String? statusCode,
    String? statusMessage,
    String? transactionId,
    String? maskedCard,
    String? orderId,
    String? paymentType,
    String? transactionTime,
    String? transactionStatus,
    String? fraudStatus,
    String? approvalCode,
    String? signatureKey,
    String? bank,
    String? grossAmount,
    String? channelResponseCode,
    String? channelResponseMessage,
    String? cardType,
    String? paymentOptionType,
    String? shopeepayReferenceNumber,
    String? referenceId,
  }) =>
      QrisCallback(
        statusCode: statusCode ?? this.statusCode,
        statusMessage: statusMessage ?? this.statusMessage,
        transactionId: transactionId ?? this.transactionId,
        maskedCard: maskedCard ?? this.maskedCard,
        orderId: orderId ?? this.orderId,
        paymentType: paymentType ?? this.paymentType,
        transactionTime: transactionTime ?? this.transactionTime,
        transactionStatus: transactionStatus ?? this.transactionStatus,
        fraudStatus: fraudStatus ?? this.fraudStatus,
        approvalCode: approvalCode ?? this.approvalCode,
        signatureKey: signatureKey ?? this.signatureKey,
        bank: bank ?? this.bank,
        grossAmount: grossAmount ?? this.grossAmount,
        channelResponseCode: channelResponseCode ?? this.channelResponseCode,
        channelResponseMessage: channelResponseMessage ?? this.channelResponseMessage,
        cardType: cardType ?? this.cardType,
        paymentOptionType: paymentOptionType ?? this.paymentOptionType,
        shopeepayReferenceNumber: shopeepayReferenceNumber ?? this.shopeepayReferenceNumber,
        referenceId: referenceId ?? this.referenceId,
      );

  factory QrisCallback.fromJson(Map<String, dynamic> json) => _$QrisCallbackFromJson(json);

  Map<String, dynamic> toJson() => _$QrisCallbackToJson(this);
}
