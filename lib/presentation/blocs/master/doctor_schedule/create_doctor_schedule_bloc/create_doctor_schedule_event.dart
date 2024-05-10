part of 'create_doctor_schedule_bloc.dart';

@freezed
class CreateDoctorScheduleEvent with _$CreateDoctorScheduleEvent {
  const factory CreateDoctorScheduleEvent.doCreate({
    required int doctorId,
    required String start,
    required String end,
    required String day,
    required String note,
    required String status,
  }) = _DoCreate;
}
