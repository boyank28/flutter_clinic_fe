// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qris_generate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrisGenerate _$QrisGenerateFromJson(Map<String, dynamic> json) => QrisGenerate(
      statusCode: json['status_code'] as String,
      statusMessage: json['status_message'] as String,
      transactionId: json['transaction_id'] as String,
      orderId: json['order_id'] as String,
      merchantId: json['merchant_id'] as String,
      grossAmount: json['gross_amount'] as String,
      currency: json['currency'] as String,
      paymentType: json['payment_type'] as String,
      transactionTime: json['transaction_time'] as String,
      transactionStatus: json['transaction_status'] as String,
      fraudStatus: json['fraud_status'] as String,
      actions: (json['actions'] as List<dynamic>)
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      qrString: json['qr_string'] as String,
      acquirer: json['acquirer'] as String,
    );

Map<String, dynamic> _$QrisGenerateToJson(QrisGenerate instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'transaction_id': instance.transactionId,
      'order_id': instance.orderId,
      'merchant_id': instance.merchantId,
      'gross_amount': instance.grossAmount,
      'currency': instance.currency,
      'payment_type': instance.paymentType,
      'transaction_time': instance.transactionTime,
      'transaction_status': instance.transactionStatus,
      'fraud_status': instance.fraudStatus,
      'actions': instance.actions,
      'qr_string': instance.qrString,
      'acquirer': instance.acquirer,
    };

Action _$ActionFromJson(Map<String, dynamic> json) => Action(
      name: json['name'] as String,
      method: json['method'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'name': instance.name,
      'method': instance.method,
      'url': instance.url,
    };
