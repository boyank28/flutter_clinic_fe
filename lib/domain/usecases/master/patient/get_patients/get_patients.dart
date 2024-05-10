import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/get_patients/get_patients_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class GetPatients implements Usecase<Result<List<Patient>>, GetPatientsParams> {
  final PatientRepository _patientRepository;

  GetPatients({required PatientRepository patientRepository}) : _patientRepository = patientRepository;

  @override
  Future<Result<List<Patient>>> call(GetPatientsParams params) async {
    var result = await _patientRepository.getAll(
      patient: params.patient,
      page: params.page,
    );

    return switch (result) {
      Success(value: final patients) => Result.success(patients),
      Failed(:final message) => Result.failed(message),
    };
  }
}
