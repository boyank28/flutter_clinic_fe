import 'package:flutter_clinic/domain/entities/payment.dart';
import 'package:flutter_clinic/domain/entities/qris_callback.dart';
import 'package:flutter_clinic/domain/entities/qris_generate.dart';

import '../../../domain/entities/result.dart';

abstract interface class PaymentRepository {
  String generateBase64({
    required String serverKey,
  });

  Future<Result<QrisGenerate>> qrisGenerate({
    required String orderId,
    required int grossAmount,
  });

  Future<Result<QrisCallback>> checkPaymentStatus({
    required int orderId,
  });

  Future<Result<Payment>> createPayment({
    required int patientReservationId,
    required String paymentMethod,
    required int totalPrice,
  });

  Future<Result<List<Payment>>> getPayments({
    required String payment,
  });
}
