part of 'delete_patient_bloc.dart';

@freezed
class DeletePatientEvent with _$DeletePatientEvent {
  const factory DeletePatientEvent.deleteById({required int id}) = _DeleteById;
}
