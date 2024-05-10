import '../../../../../domain/entities/doctor_schedule.dart';

class DoctorScheduleService {
  static List<DoctorSchedule> sundaySchedule(List<DoctorSchedule> doctorSchedules) {
    List<DoctorSchedule> sundayScedule = doctorSchedules.where((element) => element.day == 'Senin').toList()
      ..sort((a, b) => a.start.compareTo(b.start));
    return sundayScedule;
  }

  static List<DoctorSchedule> mondaySchedule(List<DoctorSchedule> doctorSchedules) {
    List<DoctorSchedule> mondayScedule = doctorSchedules.where((element) => element.day == 'Selasa').toList()
      ..sort((a, b) => a.start.compareTo(b.start));

    return mondayScedule;
  }

  static List<DoctorSchedule> tuesdaySchedule(List<DoctorSchedule> doctorSchedules) {
    List<DoctorSchedule> tuesdayScedule = doctorSchedules.where((element) => element.day == 'Rabu').toList()
      ..sort((a, b) => a.start.compareTo(b.start));

    return tuesdayScedule;
  }

  static List<DoctorSchedule> wednesdaySchedule(List<DoctorSchedule> doctorSchedules) {
    List<DoctorSchedule> wednesdayScedule = doctorSchedules.where((element) => element.day == 'Kamis').toList()
      ..sort((a, b) => a.start.compareTo(b.start));

    return wednesdayScedule;
  }

  static List<DoctorSchedule> thursdaySchedule(List<DoctorSchedule> doctorSchedules) {
    List<DoctorSchedule> thursdayScedule = doctorSchedules.where((element) => element.day == "Jum'at").toList()
      ..sort((a, b) => a.start.compareTo(b.start));

    return thursdayScedule;
  }

  static List<DoctorSchedule> fridaySchedule(List<DoctorSchedule> doctorSchedules) {
    List<DoctorSchedule> fridayScedule = doctorSchedules.where((element) => element.day == 'Sabtu').toList()
      ..sort((a, b) => a.start.compareTo(b.start));

    return fridayScedule;
  }

  static List<DoctorSchedule> saturdaySchedule(List<DoctorSchedule> doctorSchedules) {
    List<DoctorSchedule> saturdayScedule = doctorSchedules.where((element) => element.day == 'Minggu').toList()
      ..sort((a, b) => a.start.compareTo(b.start));

    return saturdayScedule;
  }

  static int doctorScheduleList(List<DoctorSchedule> doctorSchedules) {
    // List untuk semua kelompok jadwal
    List<List<DoctorSchedule>> doctorSchedulesList = [
      DoctorScheduleService.sundaySchedule(doctorSchedules),
      DoctorScheduleService.mondaySchedule(doctorSchedules),
      DoctorScheduleService.tuesdaySchedule(doctorSchedules),
      DoctorScheduleService.wednesdaySchedule(doctorSchedules),
      DoctorScheduleService.thursdaySchedule(doctorSchedules),
      DoctorScheduleService.fridaySchedule(doctorSchedules),
      DoctorScheduleService.saturdaySchedule(doctorSchedules),
    ];

    var maxScedulePerDay = doctorSchedulesList.reduce((a, b) => a.length > b.length ? a : b).length;

    return maxScedulePerDay;
  }
}
