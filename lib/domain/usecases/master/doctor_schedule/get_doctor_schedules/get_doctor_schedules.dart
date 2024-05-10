import 'package:flutter_clinic/data/repositories/master/doctor_schedule/doctor_schedule_repository.dart';
import 'package:flutter_clinic/domain/entities/doctor_schedule.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor_schedule/get_doctor_schedules/get_doctor_schedules_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class GetDoctorSchedules implements Usecase<Result<List<DoctorSchedule>>, GetDoctorSchedulesParams> {
  final DoctorScheduleRepository _doctorScheduleRepository;

  GetDoctorSchedules({required DoctorScheduleRepository doctorScheduleRepository})
      : _doctorScheduleRepository = doctorScheduleRepository;

  @override
  Future<Result<List<DoctorSchedule>>> call(GetDoctorSchedulesParams params) async {
    final result = await _doctorScheduleRepository.getAll(name: params.name);

    return switch (result) {
      Success(value: final doctorSchedules) => Result.success(doctorSchedules),
      Failed(:final message) => Result.failed(message),
    };
  }
}
