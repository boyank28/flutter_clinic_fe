// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/patient_reservation/cancel_patient_reservation/cancel_patient_reservation_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/patient_reservation/patient_reservation_repository.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/domain/usecases/patient_reservation/cancel_patient_reservation/cancel_patient_reservation.dart';

part 'cancel_patient_reservation_bloc.freezed.dart';
part 'cancel_patient_reservation_event.dart';
part 'cancel_patient_reservation_state.dart';

class CancelPatientReservationBloc extends Bloc<CancelPatientReservationEvent, CancelPatientReservationState> {
  final PatientReservationRepository _patientReservationRepository;
  CancelPatientReservationBloc(
    this._patientReservationRepository,
  ) : super(const _Initial()) {
    on<_CancelById>((event, emit) async {
      emit(const _Loading());

      CancelPatientReservation cancelPatientReservation = CancelPatientReservation(
        patientReservationRepository: _patientReservationRepository,
      );

      final result = await cancelPatientReservation(
        CancelPatientReservationParams(
          id: event.id,
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
