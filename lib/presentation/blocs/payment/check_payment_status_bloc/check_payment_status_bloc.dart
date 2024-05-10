// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/payment/check_payment_status/check_payment_status.dart';
import 'package:flutter_clinic/domain/usecases/payment/check_payment_status/check_payment_status_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/payment/payment_repository.dart';
import 'package:flutter_clinic/domain/entities/qris_callback.dart';

part 'check_payment_status_bloc.freezed.dart';
part 'check_payment_status_event.dart';
part 'check_payment_status_state.dart';

class CheckPaymentStatusBloc extends Bloc<CheckPaymentStatusEvent, CheckPaymentStatusState> {
  final PaymentRepository _paymentRepository;
  CheckPaymentStatusBloc(
    this._paymentRepository,
  ) : super(const _Initial()) {
    on<_DoCheck>((event, emit) async {
      emit(const _Loading());

      CheckPaymentStatus checkPaymentStatus = CheckPaymentStatus(
        paymentRepository: _paymentRepository,
      );

      final result = await checkPaymentStatus(
        CheckPaymentStatusParams(
          orderId: event.orderId,
        ),
      );

      switch (result) {
        case Success(value: final qrisCallback):
          emit(_Success(qrisCallback: qrisCallback));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
