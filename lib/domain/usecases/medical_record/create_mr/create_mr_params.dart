class CreateMrParams {
  final int patientReservationId;
  final String diagnosis;
  final String medicalTreatment;
  final String doctorNotes;
  final List<Map<String, dynamic>> medicalRecordServices;

  CreateMrParams({
    required this.patientReservationId,
    required this.diagnosis,
    required this.medicalTreatment,
    required this.doctorNotes,
    required this.medicalRecordServices,
  });
}
