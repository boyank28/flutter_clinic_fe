part of 'get_doctor_schedules_bloc.dart';

@freezed
class GetDoctorSchedulesState with _$GetDoctorSchedulesState {
  const factory GetDoctorSchedulesState.initial() = _Initial;
  const factory GetDoctorSchedulesState.loading() = _Loading;
  const factory GetDoctorSchedulesState.success({required List<DoctorSchedule> doctorSchedules}) = _Success;
  const factory GetDoctorSchedulesState.failed({required String message}) = _Failed;
}
