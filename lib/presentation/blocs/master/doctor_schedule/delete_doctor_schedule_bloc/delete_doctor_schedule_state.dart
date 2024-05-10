part of 'delete_doctor_schedule_bloc.dart';

@freezed
class DeleteDoctorScheduleState with _$DeleteDoctorScheduleState {
  const factory DeleteDoctorScheduleState.initial() = _Initial;
  const factory DeleteDoctorScheduleState.loading() = _Loading;
  const factory DeleteDoctorScheduleState.success({required String message}) = _Success;
  const factory DeleteDoctorScheduleState.failed({required String message}) = _Failed;
}
