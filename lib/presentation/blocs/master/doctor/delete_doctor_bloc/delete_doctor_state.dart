part of 'delete_doctor_bloc.dart';

@freezed
class DeleteDoctorState with _$DeleteDoctorState {
  const factory DeleteDoctorState.initial() = _Initial;
  const factory DeleteDoctorState.loading() = _Loading;
  const factory DeleteDoctorState.success({required String message}) = _Success;
  const factory DeleteDoctorState.failed({required String message}) = _Failed;
}
