import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_clinic/data/datasources/auth/auth_local_datasource.dart';
import 'package:flutter_clinic/data/repositories/payment/payment_repository.dart';
import 'package:flutter_clinic/domain/entities/payment.dart';
import 'package:flutter_clinic/domain/entities/qris_callback.dart';
import 'package:flutter_clinic/domain/entities/qris_generate.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentExternalDatasource implements PaymentRepository {
  final Dio _dio;

  PaymentExternalDatasource({Dio? dio}) : _dio = dio ?? Dio();

  String serverKey = dotenv.get('SB_MIDTRANS_SERVER_KEY');
  String baseUrl = dotenv.get('BASE_URL');

  @override
  String generateBase64({required String serverKey}) {
    final base64Credentials = base64Encode(utf8.encode('$serverKey:'));
    final headerBasic = 'Basic $base64Credentials';
    log('Qris Server Key $headerBasic');

    return headerBasic;
  }

  @override
  Future<Result<QrisGenerate>> qrisGenerate({
    required String orderId,
    required int grossAmount,
  }) async {
    try {
      Object transactionRequest = {
        "payment_type": "qris",
        "transaction_details": {
          "order_id": orderId,
          "gross_amount": grossAmount,
        }
      };

      final base64Credentials = base64Encode(utf8.encode('$serverKey:'));
      final headerBasic = 'Basic $base64Credentials';

      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': headerBasic,
      };

      final response = await _dio.post(
        'https://api.sandbox.midtrans.com/v2/charge',
        data: transactionRequest,
        options: Options(
          headers: headers,
        ),
      );

      final result = response.data;

      log('Qris Generate $result');

      if (result['status_code'] == '201') {
        return Result.success(QrisGenerate.fromJson(result));
      } else {
        return const Result.failed('Gagal mendapatkan kode QR');
      }
    } on DioException catch (e) {
      log('${e.response?.data}');

      return Result.failed(e.response?.data['status_message'] ?? 'Interal Server Error');
    }
  }

  @override
  Future<Result<QrisCallback>> checkPaymentStatus({
    required int orderId,
  }) async {
    try {
      final response = await _dio.get(
        'https://api.sandbox.midtrans.com/v2/$orderId/status',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': generateBase64(serverKey: serverKey)
          },
        ),
      );

      final result = response.data;

      log('$result');

      if (result['status_code'] == '201' || result['status_code'] == '200') {
        return Result.success(QrisCallback.fromJson(result));
      } else {
        return const Result.failed('Pembayan gagal');
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data ?? 'Interal Server Error');
    }
  }

  @override
  Future<Result<Payment>> createPayment({
    required int patientReservationId,
    required String paymentMethod,
    required int totalPrice,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-payment-details';
      String? token = await AuthLocalDatasource().getToken();

      log('AP URL $apiUrl');

      FormData paymentRequest = FormData.fromMap(
        {
          'patient_reservation_id': patientReservationId,
          'payment_method': paymentMethod,
          'total_price': totalPrice,
        },
      );

      final response = await _dio.post(
        apiUrl,
        data: paymentRequest,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      final result = response.data;
      log('$result');
      result['data']['total_price'] = int.parse(result['data']['total_price'].toString());

      if (result['status'] == true) {
        return Result.success(Payment.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<List<Payment>>> getPayments({
    required String payment,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-payment-details?payment=$payment';
      String? token = await AuthLocalDatasource().getToken();

      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final result = response.data;
      List<Map<String, dynamic>> paymentMap = List<Map<String, dynamic>>.from(result['data']);

      for (var item in paymentMap) {
        item['total_price'] = int.parse(item['total_price'].toString());
      }

      if (result['status'] == true) {
        return Result.success((paymentMap.map((e) => Payment.fromJson(e))).toList());
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      log(e.response?.data['message']);
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }
}
