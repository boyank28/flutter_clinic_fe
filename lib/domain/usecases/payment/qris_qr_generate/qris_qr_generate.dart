import 'package:flutter_clinic/data/repositories/payment/payment_repository.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/payment/qris_qr_generate/qris_qr_generate_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

import '../../../entities/qris_generate.dart';

class QrisQrGenerate implements Usecase<Result<QrisGenerate>, QrisQrGenerateParams> {
  final PaymentRepository _paymentRepository;

  QrisQrGenerate({required PaymentRepository paymentRepository}) : _paymentRepository = paymentRepository;

  @override
  Future<Result<QrisGenerate>> call(QrisQrGenerateParams params) async {
    final result = await _paymentRepository.qrisGenerate(
      orderId: params.orderId,
      grossAmount: params.grossAmount,
    );

    return switch (result) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message),
    };
  }
}
