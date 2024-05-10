part of 'create_payment_bloc.dart';

@freezed
class CreatePaymentEvent with _$CreatePaymentEvent {
  const factory CreatePaymentEvent.doCreate({
    required int patientReservationId,
    required String paymentMethod,
    required int totalPrice,
  }) = _DoCreate;
}
