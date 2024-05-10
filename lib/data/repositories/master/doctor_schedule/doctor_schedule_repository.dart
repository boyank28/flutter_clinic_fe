import 'package:flutter_clinic/domain/entities/result.dart';

import '../../../../domain/entities/doctor_schedule.dart';

abstract interface class DoctorScheduleRepository {
  Future<Result<List<DoctorSchedule>>> getAll({required String name});

  Future<Result<DoctorSchedule>> create({
    required int doctorId,
    required String start,
    required String end,
    required String day,
    required String status,
    required String note,
  });

  Future<Result<DoctorSchedule>> update({
    required int id,
    required int doctorId,
    required String start,
    required String end,
    required String day,
    required String status,
    required String note,
  });

  Future<Result<String>> delete({
    required int id,
  });
}
