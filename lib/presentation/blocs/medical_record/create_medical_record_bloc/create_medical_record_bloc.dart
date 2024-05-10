// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/medical_record/create_mr/create_mr.dart';
import 'package:flutter_clinic/domain/usecases/medical_record/create_mr/create_mr_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/medical_record/medical_record_repository.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';

part 'create_medical_record_bloc.freezed.dart';
part 'create_medical_record_event.dart';
part 'create_medical_record_state.dart';

class CreateMedicalRecordBloc extends Bloc<CreateMedicalRecordEvent, CreateMedicalRecordState> {
  final MedicalRecordRepository _medicalRecordRepository;
  CreateMedicalRecordBloc(
    this._medicalRecordRepository,
  ) : super(const _Initial()) {
    on<_DoCreate>((event, emit) async {
      emit(const _Loading());

      CreateMedicalRecord createMedicalRecord = CreateMedicalRecord(
        medicalRecordRepository: _medicalRecordRepository,
      );

      final result = await createMedicalRecord(
        CreateMrParams(
          patientReservationId: event.patientReservationId,
          diagnosis: event.diagnosis,
          medicalTreatment: event.medicalTreatment,
          doctorNotes: event.doctorNotes,
          medicalRecordServices: event.medicalRecordServices,
        ),
      );

      switch (result) {
        case Success(value: final medicalRecord):
          emit(_Success(medicalRecord: medicalRecord));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
      }
    });
  }
}
