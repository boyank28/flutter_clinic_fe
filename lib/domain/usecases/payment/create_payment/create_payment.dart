import 'package:flutter_clinic/data/repositories/payment/payment_repository.dart';
import 'package:flutter_clinic/domain/entities/payment.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/payment/create_payment/create_payment_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class CreatePayment implements Usecase<Result<Payment>, CreatePaymentParams> {
  final PaymentRepository _paymentRepository;

  CreatePayment({required PaymentRepository paymentRepository}) : _paymentRepository = paymentRepository;

  @override
  Future<Result<Payment>> call(CreatePaymentParams params) async {
    final result = await _paymentRepository.createPayment(
      patientReservationId: params.patientReservationId,
      paymentMethod: params.paymentMethod,
      totalPrice: params.totalPrice,
    );

    return switch (result) {
      Success(value: final payment) => Result.success(payment),
      Failed(:final message) => Result.failed(message),
    };
  }
}
