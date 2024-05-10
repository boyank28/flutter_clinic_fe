part of 'show_patient_bloc.dart';

@freezed
class ShowPatientEvent with _$ShowPatientEvent {
  const factory ShowPatientEvent.showById({required int id}) = _ShowById;
}
