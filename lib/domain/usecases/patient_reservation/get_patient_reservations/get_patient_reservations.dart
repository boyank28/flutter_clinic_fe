import 'package:flutter_clinic/data/repositories/patient_reservation/patient_reservation_repository.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/patient_reservation/get_patient_reservations/get_patient_reservation_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class GetPatientReservations implements Usecase<Result<List<PatientReservation>>, GetPatientReservationsParams> {
  final PatientReservationRepository _patientReservationRepository;

  GetPatientReservations({required PatientReservationRepository patientReservationRepository})
      : _patientReservationRepository = patientReservationRepository;

  @override
  Future<Result<List<PatientReservation>>> call(GetPatientReservationsParams params) async {
    final result = await _patientReservationRepository.getAll(patient: params.patient);

    return switch (result) {
      Success(value: final patientReservations) => Result.success(patientReservations),
      Failed(:final message) => Result.failed(message),
    };
  }
}
