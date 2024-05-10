// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/payment/create_payment/create_payment.dart';
import 'package:flutter_clinic/domain/usecases/payment/create_payment/create_payment_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/payment/payment_repository.dart';
import 'package:flutter_clinic/domain/entities/payment.dart';

part 'create_payment_bloc.freezed.dart';
part 'create_payment_event.dart';
part 'create_payment_state.dart';

class CreatePaymentBloc extends Bloc<CreatePaymentEvent, CreatePaymentState> {
  final PaymentRepository _paymentRepository;
  CreatePaymentBloc(
    this._paymentRepository,
  ) : super(const _Initial()) {
    on<_DoCreate>((event, emit) async {
      emit(const _Loading());

      CreatePayment createPayment = CreatePayment(
        paymentRepository: _paymentRepository,
      );

      final result = await createPayment(
        CreatePaymentParams(
          patientReservationId: event.patientReservationId,
          paymentMethod: event.paymentMethod,
          totalPrice: event.totalPrice,
        ),
      );

      switch (result) {
        case Success(value: final payment):
          emit(_Success(payment: payment));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
