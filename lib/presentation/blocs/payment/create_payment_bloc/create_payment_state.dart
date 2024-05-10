part of 'create_payment_bloc.dart';

@freezed
class CreatePaymentState with _$CreatePaymentState {
  const factory CreatePaymentState.initial() = _Initial;
  const factory CreatePaymentState.loading() = _Loading;
  const factory CreatePaymentState.success({required Payment payment}) = _Success;
  const factory CreatePaymentState.failed({required String message}) = _Failed;
}
