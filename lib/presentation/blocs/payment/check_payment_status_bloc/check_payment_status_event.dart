part of 'check_payment_status_bloc.dart';

@freezed
class CheckPaymentStatusEvent with _$CheckPaymentStatusEvent {
  const factory CheckPaymentStatusEvent.doCheck({required int orderId}) = _DoCheck;
}
