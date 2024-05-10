part of 'delete_doctor_bloc.dart';

@freezed
class DeleteDoctorEvent with _$DeleteDoctorEvent {
  const factory DeleteDoctorEvent.doDelete({required int id}) = _DoDelete;
}
