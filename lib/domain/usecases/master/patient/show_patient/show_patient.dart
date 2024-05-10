import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/show_patient/show_patient_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class ShowPatient implements Usecase<Result<Patient>, ShowPatientParams> {
  final PatientRepository _patientRepository;

  ShowPatient({required PatientRepository patientRepository}) : _patientRepository = patientRepository;

  @override
  Future<Result<Patient>> call(ShowPatientParams params) async {
    var result = await _patientRepository.show(id: params.id);

    return switch (result) {
      Success(value: final patient) => Result.success(patient),
      Failed(:final message) => Result.failed(message)
    };
  }
}
