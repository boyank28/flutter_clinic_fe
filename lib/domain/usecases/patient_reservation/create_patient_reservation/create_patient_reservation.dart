import 'package:flutter_clinic/data/repositories/patient_reservation/patient_reservation_repository.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/patient_reservation/create_patient_reservation/create_patient_reservation_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class CreatePatientReservation implements Usecase<Result<PatientReservation>, CreatePatientReservationParams> {
  final PatientReservationRepository _patientReservationRepository;

  CreatePatientReservation({required PatientReservationRepository patientReservationRepository})
      : _patientReservationRepository = patientReservationRepository;

  @override
  Future<Result<PatientReservation>> call(CreatePatientReservationParams params) async {
    final result = await _patientReservationRepository.create(
      doctorId: params.doctorId,
      patientId: params.patientId,
      scheduleTime: params.scheduleTime,
      complaint: params.complaint,
      queueNumber: params.queueNumber,
    );

    return switch (result) {
      Success(value: final patientReservation) => Result.success(patientReservation),
      Failed(:final message) => Result.failed(message),
    };
  }
}
