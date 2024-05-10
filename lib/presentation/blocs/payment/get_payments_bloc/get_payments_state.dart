part of 'get_payments_bloc.dart';

@freezed
class GetPaymentsState with _$GetPaymentsState {
  const factory GetPaymentsState.initial() = _Initial;
  const factory GetPaymentsState.loading() = _Loading;
  const factory GetPaymentsState.success({required List<Payment> payments}) = _Success;
  const factory GetPaymentsState.failed({required String message}) = _failed;
}
