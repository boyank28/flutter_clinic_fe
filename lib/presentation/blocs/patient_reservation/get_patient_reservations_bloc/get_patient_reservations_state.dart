part of 'get_patient_reservations_bloc.dart';

@freezed
class GetPatientReservationsState with _$GetPatientReservationsState {
  const factory GetPatientReservationsState.initial() = _Initial;
  const factory GetPatientReservationsState.loading() = _Loading;
  const factory GetPatientReservationsState.success({required List<PatientReservation> patientReservations}) = _Success;
  const factory GetPatientReservationsState.failed({required String message}) = _Failed;
}
