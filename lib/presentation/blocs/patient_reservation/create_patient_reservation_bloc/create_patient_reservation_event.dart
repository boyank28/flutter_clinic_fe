part of 'create_patient_reservation_bloc.dart';

@freezed
class CreatePatientReservationEvent with _$CreatePatientReservationEvent {
  const factory CreatePatientReservationEvent.doCreate({
    required int doctorId,
    required int patientId,
    required DateTime scheduleTime,
    required String complaint,
    required int queueNumber,
  }) = _DoCreate;
}
