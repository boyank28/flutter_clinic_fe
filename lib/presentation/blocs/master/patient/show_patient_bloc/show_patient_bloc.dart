// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/show_patient/show_patient.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/show_patient/show_patient_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';

part 'show_patient_bloc.freezed.dart';
part 'show_patient_event.dart';
part 'show_patient_state.dart';

class ShowPatientBloc extends Bloc<ShowPatientEvent, ShowPatientState> {
  final PatientRepository _patientRepository;
  ShowPatientBloc(
    this._patientRepository,
  ) : super(const _Initial()) {
    on<_ShowById>(
      (event, emit) async {
        emit(const _Loading());

        ShowPatient showPatient = ShowPatient(patientRepository: _patientRepository);

        final result = await showPatient(ShowPatientParams(id: event.id));

        switch (result) {
          case Success(value: final patient):
            emit(_Success(patient: patient));
            break;
          case Failed(:final message):
            emit(_Failed(message: message));
            break;
        }
      },
    );
  }
}
