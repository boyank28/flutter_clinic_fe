import 'package:flutter_clinic/domain/entities/medical_record.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/medical_record/get_mr/get_mr_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

import '../../../../data/repositories/medical_record/medical_record_repository.dart';

class GetMedicalRecords implements Usecase<Result<List<MedicalRecord>>, GetMrParams> {
  final MedicalRecordRepository _medicalRecordRepository;

  GetMedicalRecords({required MedicalRecordRepository medicalRecordRepository})
      : _medicalRecordRepository = medicalRecordRepository;

  @override
  Future<Result<List<MedicalRecord>>> call(GetMrParams params) async {
    final result = await _medicalRecordRepository.getAll(
      record: params.record,
      page: params.page,
    );

    return switch (result) {
      Success(value: final medicalRecords) => Result.success(medicalRecords),
      Failed(:final message) => Result.failed(message),
    };
  }
}
