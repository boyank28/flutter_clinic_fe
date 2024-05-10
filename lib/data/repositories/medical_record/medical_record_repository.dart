import 'package:flutter_clinic/domain/entities/medical_record.dart';
import 'package:flutter_clinic/domain/entities/result.dart';

abstract interface class MedicalRecordRepository {
  Future<Result<List<MedicalRecord>>> getAll({
    required String record,
    required int page,
  });

  Future<Result<MedicalRecord>> getByReservationId({
    required int reservationId,
  });

  Future<Result<MedicalRecord>> create({
    required int patientReservationId,
    required String diagnosis,
    required String medicalTreatment,
    required String doctorNotes,
    required List<Map<String, dynamic>> medicalRecordServices,
  });
}
