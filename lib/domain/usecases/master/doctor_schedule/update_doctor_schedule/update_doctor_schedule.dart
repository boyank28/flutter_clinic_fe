import 'package:flutter_clinic/data/repositories/master/doctor_schedule/doctor_schedule_repository.dart';
import 'package:flutter_clinic/domain/entities/doctor_schedule.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor_schedule/update_doctor_schedule/update_doctor_schedule_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class UpdateDoctorSchedule implements Usecase<Result<DoctorSchedule>, UpdateDoctorScheduleParams> {
  final DoctorScheduleRepository _doctorScheduleRepository;

  UpdateDoctorSchedule({required DoctorScheduleRepository doctorScheduleRepository})
      : _doctorScheduleRepository = doctorScheduleRepository;

  @override
  Future<Result<DoctorSchedule>> call(UpdateDoctorScheduleParams params) async {
    final result = await _doctorScheduleRepository.update(
      id: params.id,
      doctorId: params.doctorId,
      start: params.start,
      end: params.end,
      day: params.day,
      status: params.status,
      note: params.note,
    );

    return switch (result) {
      Success(value: final doctorSchedule) => Result.success(doctorSchedule),
      Failed(:final message) => Result.failed(message),
    };
  }
}
