// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/delete_patient/delete_patient.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/delete_patient/delete_patient_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';

part 'delete_patient_bloc.freezed.dart';
part 'delete_patient_event.dart';
part 'delete_patient_state.dart';

class DeletePatientBloc extends Bloc<DeletePatientEvent, DeletePatientState> {
  final PatientRepository _patientRepository;
  DeletePatientBloc(
    this._patientRepository,
  ) : super(const _Initial()) {
    on<_DeleteById>((event, emit) async {
      emit(const _Loading());

      DeletePatient deletePatient = DeletePatient(patientRepository: _patientRepository);

      final result = await deletePatient(DeletePatientParams(id: event.id));

      switch (result) {
        case Success(value: final message):
          emit(_Success(message: message));
          break;
        case Failed(:final message):
          emit(_Success(message: message));
          break;
      }
    });
  }
}
