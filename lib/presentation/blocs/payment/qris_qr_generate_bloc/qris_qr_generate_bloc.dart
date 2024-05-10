// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/payment/qris_qr_generate/qris_qr_generate.dart';
import 'package:flutter_clinic/domain/usecases/payment/qris_qr_generate/qris_qr_generate_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/payment/payment_repository.dart';
import 'package:flutter_clinic/domain/entities/qris_generate.dart';

part 'qris_qr_generate_bloc.freezed.dart';
part 'qris_qr_generate_event.dart';
part 'qris_qr_generate_state.dart';

class QrisQrGenerateBloc extends Bloc<QrisQrGenerateEvent, QrisQrGenerateState> {
  final PaymentRepository _paymentRepository;
  QrisQrGenerateBloc(
    this._paymentRepository,
  ) : super(const _Initial()) {
    on<_GetQrCode>((event, emit) async {
      emit(const _Loading());

      QrisQrGenerate qrisQrGenerate = QrisQrGenerate(
        paymentRepository: _paymentRepository,
      );

      String orderId = DateTime.now().millisecondsSinceEpoch.toString();

      final result = await qrisQrGenerate(
        QrisQrGenerateParams(
          orderId: orderId,
          grossAmount: event.grossAmount,
        ),
      );

      switch (result) {
        case Success(value: final generateResult):
          emit(_Success(generateResult: generateResult));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
