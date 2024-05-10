import 'package:flutter_clinic/data/repositories/medical_record/medical_record_repository.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/medical_record/get_mr_by_reservation_id/get_mr_by_reservation_id_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class GetMrByReservationId implements Usecase<Result<MedicalRecord>, GetMrByReservationIdParams> {
  final MedicalRecordRepository _medicalRecordRepository;

  GetMrByReservationId({required MedicalRecordRepository medicalRecordRepository})
      : _medicalRecordRepository = medicalRecordRepository;

  @override
  Future<Result<MedicalRecord>> call(GetMrByReservationIdParams params) async {
    final result = await _medicalRecordRepository.getByReservationId(
      reservationId: params.reservationId,
    );

    return switch (result) {
      Success(value: final medicalRecord) => Result.success(medicalRecord),
      Failed(:final message) => Result.failed(message),
    };
  }
}
