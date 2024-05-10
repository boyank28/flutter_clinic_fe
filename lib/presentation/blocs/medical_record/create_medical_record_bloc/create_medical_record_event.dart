part of 'create_medical_record_bloc.dart';

@freezed
class CreateMedicalRecordEvent with _$CreateMedicalRecordEvent {
  const factory CreateMedicalRecordEvent.doCreate({
    required int patientReservationId,
    required String diagnosis,
    required String medicalTreatment,
    required String doctorNotes,
    required List<Map<String, dynamic>> medicalRecordServices,
  }) = _DoCreate;
}
