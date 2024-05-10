import 'package:flutter_clinic/data/repositories/payment/payment_repository.dart';
import 'package:flutter_clinic/domain/entities/qris_callback.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/payment/check_payment_status/check_payment_status_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class CheckPaymentStatus implements Usecase<Result<QrisCallback>, CheckPaymentStatusParams> {
  final PaymentRepository _paymentRepository;

  CheckPaymentStatus({required PaymentRepository paymentRepository}) : _paymentRepository = paymentRepository;

  @override
  Future<Result<QrisCallback>> call(CheckPaymentStatusParams params) async {
    final result = await _paymentRepository.checkPaymentStatus(
      orderId: params.orderId,
    );

    return switch (result) {
      Success(value: final qrisCallback) => Result.success(qrisCallback),
      Failed(:final message) => Result.failed(message),
    };
  }
}
