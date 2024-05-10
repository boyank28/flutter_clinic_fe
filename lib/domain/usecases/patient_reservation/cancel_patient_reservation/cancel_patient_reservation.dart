import 'package:flutter_clinic/data/repositories/patient_reservation/patient_reservation_repository.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/patient_reservation/cancel_patient_reservation/cancel_patient_reservation_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class CancelPatientReservation implements Usecase<Result<PatientReservation>, CancelPatientReservationParams> {
  final PatientReservationRepository _patientReservationRepository;

  CancelPatientReservation({required PatientReservationRepository patientReservationRepository})
      : _patientReservationRepository = patientReservationRepository;

  @override
  Future<Result<PatientReservation>> call(CancelPatientReservationParams params) async {
    final result = await _patientReservationRepository.cancelByID(
      id: params.id,
    );

    return switch (result) {
      Success(value: final patientReservation) => Result.success(patientReservation),
      Failed(:final message) => Result.failed(message),
    };
  }
}
