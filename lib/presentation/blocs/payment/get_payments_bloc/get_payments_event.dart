part of 'get_payments_bloc.dart';

@freezed
class GetPaymentsEvent with _$GetPaymentsEvent {
  const factory GetPaymentsEvent.doGet({required String payment}) = _DoGet;
}
