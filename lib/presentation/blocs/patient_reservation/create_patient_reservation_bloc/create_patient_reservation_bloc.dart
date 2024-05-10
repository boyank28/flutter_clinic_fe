// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/patient_reservation/create_patient_reservation/create_patient_reservation.dart';
import 'package:flutter_clinic/domain/usecases/patient_reservation/create_patient_reservation/create_patient_reservation_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/patient_reservation/patient_reservation_repository.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';

part 'create_patient_reservation_bloc.freezed.dart';
part 'create_patient_reservation_event.dart';
part 'create_patient_reservation_state.dart';

class CreatePatientReservationBloc extends Bloc<CreatePatientReservationEvent, CreatePatientReservationState> {
  final PatientReservationRepository _patientReservationRepository;
  CreatePatientReservationBloc(
    this._patientReservationRepository,
  ) : super(const _Initial()) {
    on<_DoCreate>((event, emit) async {
      emit(const _Loading());

      CreatePatientReservation createPatientReservation = CreatePatientReservation(
        patientReservationRepository: _patientReservationRepository,
      );

      final result = await createPatientReservation(
        CreatePatientReservationParams(
          doctorId: event.doctorId,
          patientId: event.patientId,
          scheduleTime: event.scheduleTime,
          complaint: event.complaint,
          queueNumber: event.queueNumber,
        ),
      );

      switch (result) {
        case Success(value: final patientReservation):
          emit(_Success(patientReservation: patientReservation));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
