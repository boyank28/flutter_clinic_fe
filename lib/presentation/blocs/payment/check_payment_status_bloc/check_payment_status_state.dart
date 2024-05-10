part of 'check_payment_status_bloc.dart';

@freezed
class CheckPaymentStatusState with _$CheckPaymentStatusState {
  const factory CheckPaymentStatusState.initial() = _Initial;
  const factory CheckPaymentStatusState.loading() = _Loading;
  const factory CheckPaymentStatusState.success({required QrisCallback qrisCallback}) = _Success;
  const factory CheckPaymentStatusState.failed({required String message}) = _Failed;
}
