part of 'cancel_patient_reservation_bloc.dart';

@freezed
class CancelPatientReservationEvent with _$CancelPatientReservationEvent {
  const factory CancelPatientReservationEvent.cancelById({
    required int id,
  }) = _CancelById;
}
