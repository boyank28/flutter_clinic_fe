part of 'get_patient_reservations_bloc.dart';

@freezed
class GetPatientReservationsEvent with _$GetPatientReservationsEvent {
  const factory GetPatientReservationsEvent.doGet({required String patient}) = _DoGet;
}
