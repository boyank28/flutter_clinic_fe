import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/create_patient/create_patient_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class CreatePatient implements Usecase<Result<Patient>, CreatePatientParams> {
  final PatientRepository _patientRepository;

  CreatePatient({required PatientRepository patientRepository}) : _patientRepository = patientRepository;

  @override
  Future<Result<Patient>> call(CreatePatientParams params) async {
    var result = await _patientRepository.create(
      nik: params.nik,
      noKk: params.noKk,
      name: params.name,
      phone: params.phone,
      email: params.email,
      gender: params.gender,
      birthPlace: params.birthPlace,
      birthDate: params.birthDate,
      addressLine: params.addressLine,
      city: params.city,
      cityCode: params.cityCode,
      province: params.province,
      provinceCode: params.provinceCode,
      district: params.district,
      districtCode: params.districtCode,
      village: params.village,
      villageCode: params.villageCode,
      rt: params.rt,
      rw: params.rw,
      postalCode: params.postalCode,
      maritalStatus: params.maritalStatus,
      relationshipName: params.relationshipName,
      relationshipPhone: params.relationshipPhone,
      isDeceased: params.isDeceased,
    );

    return switch (result) {
      Success(value: final patient) => Result.success(patient),
      Failed(:final message) => Result.failed(message)
    };
  }
}
