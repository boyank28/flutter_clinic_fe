import 'package:flutter_clinic/data/repositories/master/doctor/doctor_repository.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/delete_doctor/delete_doctor_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class DeleteDoctor implements Usecase<Result<String>, DeleteDoctorParams> {
  final DoctorRepository _doctorRepository;

  DeleteDoctor({required DoctorRepository doctorRepository}) : _doctorRepository = doctorRepository;

  @override
  Future<Result<String>> call(DeleteDoctorParams params) async {
    var result = await _doctorRepository.delete(id: params.id);

    return switch (result) {
      Success(value: final message) => Result.success(message),
      Failed(:final message) => Result.failed(message),
    };
  }
}
