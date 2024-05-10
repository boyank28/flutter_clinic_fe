// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/get_patients/get_patients.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/get_patients/get_patients_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';

import '../../../../../domain/entities/patient.dart';

part 'get_patients_bloc.freezed.dart';
part 'get_patients_event.dart';
part 'get_patients_state.dart';

class GetPatientsBloc extends Bloc<GetPatientsEvent, GetPatientsState> {
  final PatientRepository _patientRepository;
  int currentPage = 1;
  bool isNext = false;
  GetPatientsBloc(
    this._patientRepository,
  ) : super(const _Initial()) {
    on<_GetFirst>(
      (event, emit) async {
        emit(const _Loading());
        currentPage = 1;

        GetPatients getPatients = GetPatients(patientRepository: _patientRepository);

        final result = await getPatients(GetPatientsParams(patient: event.patient, page: currentPage));

        switch (result) {
          case Success(value: final patients):
            isNext = patients.length == 10;
            currentPage = currentPage + 1;
            emit(_Success(patients: patients, isNext: isNext));
            break;
          case Failed(:final message):
            emit(_Failed(message: message));
            break;
        }
      },
    );

    on<_GetNext>(
      (event, emit) async {
        List<Patient> currentValue =
            state.whenOrNull(success: (patients, isNext) => patients)?.map((e) => e).toList() ?? [];

        GetPatients getPatients = GetPatients(patientRepository: _patientRepository);

        final result = await getPatients(GetPatientsParams(patient: event.patient, page: currentPage));

        switch (result) {
          case Success(value: final patients):
            isNext = patients.length == 10;
            currentPage = currentPage + 1;
            emit(
              _Success(
                patients: [...currentValue, ...patients],
                isNext: isNext,
              ),
            );
            break;
          case Failed(:final message):
            emit(_Failed(message: message));
        }
      },
    );
  }
}
