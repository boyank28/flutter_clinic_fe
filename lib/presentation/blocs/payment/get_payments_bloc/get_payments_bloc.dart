// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/payment/get_payments/get_payments.dart';
import 'package:flutter_clinic/domain/usecases/payment/get_payments/get_payments_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/payment/payment_repository.dart';

import '../../../../domain/entities/payment.dart';

part 'get_payments_bloc.freezed.dart';
part 'get_payments_event.dart';
part 'get_payments_state.dart';

class GetPaymentsBloc extends Bloc<GetPaymentsEvent, GetPaymentsState> {
  final PaymentRepository _paymentRepository;
  GetPaymentsBloc(
    this._paymentRepository,
  ) : super(const _Initial()) {
    on<_DoGet>((event, emit) async {
      emit(const _Loading());

      GetPayments getPayments = GetPayments(
        paymentRepository: _paymentRepository,
      );

      final result = await getPayments(
        GetPaymentsParams(
          payment: event.payment,
        ),
      );

      switch (result) {
        case Success(value: final payments):
          emit(_Success(payments: payments));
          break;
        case Failed(:final message):
          emit(_failed(message: message));
          break;
      }
    });
  }
}
