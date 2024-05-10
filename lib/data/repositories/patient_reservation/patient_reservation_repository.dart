import 'package:flutter_clinic/domain/entities/patient_reservation.dart';

import '../../../domain/entities/result.dart';

abstract interface class PatientReservationRepository {
  Future<Result<List<PatientReservation>>> getAll({required String patient});

  Future<Result<PatientReservation>> create({
    required int patientId,
    required int doctorId,
    required DateTime scheduleTime,
    required String complaint,
    required int queueNumber,
  });

  Future<Result<PatientReservation>> cancelByID({required int id});
}
