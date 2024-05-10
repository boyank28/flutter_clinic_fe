// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreatePatientReservationParams {
  final int doctorId;
  final int patientId;
  final DateTime scheduleTime;
  final String complaint;
  final int queueNumber;

  CreatePatientReservationParams({
    required this.doctorId,
    required this.patientId,
    required this.scheduleTime,
    required this.complaint,
    required this.queueNumber,
  });
}
