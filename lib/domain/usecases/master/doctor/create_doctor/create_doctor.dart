import 'package:flutter_clinic/data/repositories/master/doctor/doctor_repository.dart';
import 'package:flutter_clinic/domain/entities/doctor.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/create_doctor/create_doctor_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class CreateDoctor implements Usecase<Result<Doctor>, CreateDoctorParams> {
  final DoctorRepository _doctorRepository;

  CreateDoctor({required DoctorRepository doctorRepository}) : _doctorRepository = doctorRepository;

  @override
  Future<Result<Doctor>> call(CreateDoctorParams params) async {
    var result = await _doctorRepository.create(
      name: params.name,
      nik: params.nik,
      sip: params.sip,
      idIhs: params.idIhs,
      specialization: params.specialization,
      address: params.address,
      email: params.email,
      phone: params.phone,
      photo: params.photo,
    );

    return switch (result) {
      Success(value: final doctor) => Result.success(doctor),
      Failed(:final message) => Result.failed(message),
    };
  }
}
