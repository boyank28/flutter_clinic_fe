import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/delete_patient/delete_patient_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class DeletePatient implements Usecase<Result<String>, DeletePatientParams> {
  final PatientRepository _patientRepository;

  DeletePatient({required PatientRepository patientRepository}) : _patientRepository = patientRepository;

  @override
  Future<Result<String>> call(DeletePatientParams params) async {
    var result = await _patientRepository.delete(
      id: params.id,
    );

    return switch (result) {
      Success(value: final message) => Result.success(message),
      Failed(:final message) => Result.failed(message),
    };
  }
}
