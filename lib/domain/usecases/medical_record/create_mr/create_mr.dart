import 'package:flutter_clinic/data/repositories/medical_record/medical_record_repository.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/medical_record/create_mr/create_mr_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class CreateMedicalRecord implements Usecase<Result<MedicalRecord>, CreateMrParams> {
  final MedicalRecordRepository _medicalRecordRepository;

  CreateMedicalRecord({required MedicalRecordRepository medicalRecordRepository})
      : _medicalRecordRepository = medicalRecordRepository;

  @override
  Future<Result<MedicalRecord>> call(CreateMrParams params) async {
    final result = await _medicalRecordRepository.create(
      patientReservationId: params.patientReservationId,
      diagnosis: params.diagnosis,
      medicalTreatment: params.medicalTreatment,
      doctorNotes: params.doctorNotes,
      medicalRecordServices: params.medicalRecordServices,
    );

    return switch (result) {
      Success(value: final medicalRecord) => Result.success(medicalRecord),
      Failed(:final message) => Result.failed(message),
    };
  }
}
