part of 'create_doctor_schedule_bloc.dart';

@freezed
class CreateDoctorScheduleState with _$CreateDoctorScheduleState {
  const factory CreateDoctorScheduleState.initial() = _Initial;
  const factory CreateDoctorScheduleState.loading() = _Loading;
  const factory CreateDoctorScheduleState.success({required DoctorSchedule doctorSchedule}) = _Success;
  const factory CreateDoctorScheduleState.failed({required String message}) = _Failed;
}
