import 'package:flutter_clinic/data/repositories/master/doctor/doctor_repository.dart';
import 'package:flutter_clinic/domain/entities/doctor.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/get_doctors/get_doctors_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class GetDoctors implements Usecase<Result<List<Doctor>>, GetDoctorsParams> {
  final DoctorRepository _doctorRepository;

  GetDoctors({required DoctorRepository doctorRepository}) : _doctorRepository = doctorRepository;

  @override
  Future<Result<List<Doctor>>> call(GetDoctorsParams params) async {
    var result = await _doctorRepository.getAll(
      name: params.name,
      page: params.page,
    );

    return switch (result) {
      Success(value: final doctors) => Result.success(doctors),
      Failed(:final message) => Result.failed(message),
    };
  }
}
