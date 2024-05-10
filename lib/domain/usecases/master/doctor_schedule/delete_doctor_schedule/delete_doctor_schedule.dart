import 'package:flutter_clinic/data/repositories/master/doctor_schedule/doctor_schedule_repository.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor_schedule/delete_doctor_schedule/delete_doctor_schedule_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class DeleteDoctorSchedule implements Usecase<Result<String>, DeleteDoctorScheduleParams> {
  final DoctorScheduleRepository _doctorScheduleRepository;

  DeleteDoctorSchedule({required DoctorScheduleRepository doctorScheduleRepository})
      : _doctorScheduleRepository = doctorScheduleRepository;

  @override
  Future<Result<String>> call(DeleteDoctorScheduleParams params) async {
    final result = await _doctorScheduleRepository.delete(id: params.id);

    return switch (result) {
      Success(value: final message) => Result.success(message),
      Failed(:final message) => Result.failed(message),
    };
  }
}
