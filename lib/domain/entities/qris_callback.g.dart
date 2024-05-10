// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qris_callback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrisCallback _$QrisCallbackFromJson(Map<String, dynamic> json) => QrisCallback(
      statusCode: json['status_code'] as String,
      statusMessage: json['status_message'] as String,
      transactionId: json['transaction_id'] as String,
      maskedCard: json['masked_card'] as String?,
      orderId: json['order_id'] as String,
      paymentType: json['payment_type'] as String,
      transactionTime: json['transaction_time'] as String,
      transactionStatus: json['transaction_status'] as String,
      fraudStatus: json['fraud_status'] as String?,
      approvalCode: json['approval_code'] as String?,
      signatureKey: json['signature_key'] as String?,
      bank: json['bank'] as String?,
      grossAmount: json['gross_amount'] as String,
      channelResponseCode: json['channel_response_code'] as String?,
      channelResponseMessage: json['channel_response_message'] as String?,
      cardType: json['card_type'] as String?,
      paymentOptionType: json['payment_option_type'] as String?,
      shopeepayReferenceNumber: json['shopeepay_reference_number'] as String?,
      referenceId: json['reference_id'] as String?,
    );

Map<String, dynamic> _$QrisCallbackToJson(QrisCallback instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'transaction_id': instance.transactionId,
      'masked_card': instance.maskedCard,
      'order_id': instance.orderId,
      'payment_type': instance.paymentType,
      'transaction_time': instance.transactionTime,
      'transaction_status': instance.transactionStatus,
      'fraud_status': instance.fraudStatus,
      'approval_code': instance.approvalCode,
      'signature_key': instance.signatureKey,
      'bank': instance.bank,
      'gross_amount': instance.grossAmount,
      'channel_response_code': instance.channelResponseCode,
      'channel_response_message': instance.channelResponseMessage,
      'card_type': instance.cardType,
      'payment_option_type': instance.paymentOptionType,
      'shopeepay_reference_number': instance.shopeepayReferenceNumber,
      'reference_id': instance.referenceId,
    };
