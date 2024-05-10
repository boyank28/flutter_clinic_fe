part of 'update_doctor_schedule_bloc.dart';

@freezed
class UpdateDoctorScheduleState with _$UpdateDoctorScheduleState {
  const factory UpdateDoctorScheduleState.initial() = _Initial;
  const factory UpdateDoctorScheduleState.loading() = _Loading;
  const factory UpdateDoctorScheduleState.success({required DoctorSchedule doctorSchedule}) = _Success;
  const factory UpdateDoctorScheduleState.failed({required String message}) = _Failed;
}
