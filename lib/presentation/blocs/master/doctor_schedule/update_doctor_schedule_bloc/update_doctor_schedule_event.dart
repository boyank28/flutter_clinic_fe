part of 'update_doctor_schedule_bloc.dart';

@freezed
class UpdateDoctorScheduleEvent with _$UpdateDoctorScheduleEvent {
  const factory UpdateDoctorScheduleEvent.updateById({
    required int id,
    required int doctorId,
    required String start,
    required String end,
    required String day,
    required String note,
    required String status,
  }) = _UpdateById;
}
