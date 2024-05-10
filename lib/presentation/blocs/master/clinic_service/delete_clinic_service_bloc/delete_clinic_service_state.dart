part of 'delete_clinic_service_bloc.dart';

@freezed
class DeleteClinicServiceState with _$DeleteClinicServiceState {
  const factory DeleteClinicServiceState.initial() = _Initial;
  const factory DeleteClinicServiceState.loading() = _Loading;
  const factory DeleteClinicServiceState.success({required String message}) = _Success;
  const factory DeleteClinicServiceState.failed({required String message}) = _Failed;
}
