part of 'create_patient_reservation_bloc.dart';

@freezed
class CreatePatientReservationState with _$CreatePatientReservationState {
  const factory CreatePatientReservationState.initial() = _Initial;
  const factory CreatePatientReservationState.loading() = _Loading;
  const factory CreatePatientReservationState.success({required PatientReservation patientReservation}) = _Success;
  const factory CreatePatientReservationState.failed({required String message}) = _Failed;
}
