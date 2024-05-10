import 'package:flutter_clinic/data/repositories/payment/payment_repository.dart';
import 'package:flutter_clinic/domain/entities/payment.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/payment/get_payments/get_payments_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class GetPayments implements Usecase<Result<List<Payment>>, GetPaymentsParams> {
  final PaymentRepository _paymentRepository;

  GetPayments({required PaymentRepository paymentRepository}) : _paymentRepository = paymentRepository;

  @override
  Future<Result<List<Payment>>> call(GetPaymentsParams params) async {
    final result = await _paymentRepository.getPayments(
      payment: params.payment,
    );

    return switch (result) {
      Success(value: final payments) => Result.success(payments),
      Failed(:final message) => Result.failed(message),
    };
  }
}
