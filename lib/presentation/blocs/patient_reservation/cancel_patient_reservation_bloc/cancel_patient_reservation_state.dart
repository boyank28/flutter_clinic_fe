part of 'cancel_patient_reservation_bloc.dart';

@freezed
class CancelPatientReservationState with _$CancelPatientReservationState {
  const factory CancelPatientReservationState.initial() = _Initial;
  const factory CancelPatientReservationState.loading() = _Loading;
  const factory CancelPatientReservationState.success({required PatientReservation patientReservation}) = _Success;
  const factory CancelPatientReservationState.failed({required String message}) = _Failed;
}
