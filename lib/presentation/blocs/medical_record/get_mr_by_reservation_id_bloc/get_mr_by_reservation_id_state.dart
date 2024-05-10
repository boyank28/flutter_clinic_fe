part of 'get_mr_by_reservation_id_bloc.dart';

@freezed
class GetMrByReservationIdState with _$GetMrByReservationIdState {
  const factory GetMrByReservationIdState.initial() = _Initial;
  const factory GetMrByReservationIdState.loading() = _Loading;
  const factory GetMrByReservationIdState.success({required MedicalRecord medicalRecord}) = _Success;
  const factory GetMrByReservationIdState.failed({required String message}) = _Failed;
}
