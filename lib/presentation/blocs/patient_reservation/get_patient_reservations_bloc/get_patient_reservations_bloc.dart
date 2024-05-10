// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/usecases/patient_reservation/get_patient_reservations/get_patient_reservation_params.dart';
import 'package:flutter_clinic/domain/usecases/patient_reservation/get_patient_reservations/get_patient_reservations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/patient_reservation/patient_reservation_repository.dart';

import '../../../../domain/entities/patient_reservation.dart';
import '../../../../domain/entities/result.dart';

part 'get_patient_reservations_bloc.freezed.dart';
part 'get_patient_reservations_event.dart';
part 'get_patient_reservations_state.dart';

class GetPatientReservationsBloc extends Bloc<GetPatientReservationsEvent, GetPatientReservationsState> {
  final PatientReservationRepository _patientReservationRepository;
  GetPatientReservationsBloc(
    this._patientReservationRepository,
  ) : super(const _Initial()) {
    on<_DoGet>((event, emit) async {
      emit(const _Loading());

      GetPatientReservations getPatientReservations = GetPatientReservations(
        patientReservationRepository: _patientReservationRepository,
      );

      final result = await getPatientReservations(GetPatientReservationsParams(patient: event.patient));

      switch (result) {
        case Success(value: final patientReservations):
          emit(_Success(patientReservations: patientReservations));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
