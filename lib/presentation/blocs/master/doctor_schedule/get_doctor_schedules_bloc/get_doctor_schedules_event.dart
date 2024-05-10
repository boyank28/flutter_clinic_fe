part of 'get_doctor_schedules_bloc.dart';

@freezed
class GetDoctorSchedulesEvent with _$GetDoctorSchedulesEvent {
  const factory GetDoctorSchedulesEvent.getAll({required String name}) = _GetAll;
}
