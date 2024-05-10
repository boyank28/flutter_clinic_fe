// ignore_for_file: public_member_api_docs, sort_constructors_first
class UpdateDoctorScheduleParams {
  final int id;
  final int doctorId;
  final String start;
  final String end;
  final String day;
  final String status;
  final String note;

  UpdateDoctorScheduleParams(
      {required this.id,
      required this.doctorId,
      required this.start,
      required this.end,
      required this.day,
      required this.status,
      required this.note});
}
