part of 'delete_doctor_schedule_bloc.dart';

@freezed
class DeleteDoctorScheduleEvent with _$DeleteDoctorScheduleEvent {
  const factory DeleteDoctorScheduleEvent.deleteById({required int id}) = _DeleteById;
}
