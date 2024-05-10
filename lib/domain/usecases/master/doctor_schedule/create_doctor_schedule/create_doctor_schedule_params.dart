class CreateDoctorScheduleParams {
  final int doctorId;
  final String start;
  final String end;
  final String day;
  final String status;
  final String note;

  CreateDoctorScheduleParams(
      {required this.doctorId,
      required this.start,
      required this.end,
      required this.day,
      required this.status,
      required this.note});
}
