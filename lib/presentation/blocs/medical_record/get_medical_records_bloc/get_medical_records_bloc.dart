// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/usecases/medical_record/get_mr/get_mr_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/medical_record/medical_record_repository.dart';
import 'package:flutter_clinic/domain/usecases/medical_record/get_mr/get_mr.dart';

import '../../../../domain/entities/medical_record.dart';
import '../../../../domain/entities/result.dart';

part 'get_medical_records_bloc.freezed.dart';
part 'get_medical_records_event.dart';
part 'get_medical_records_state.dart';

class GetMedicalRecordsBloc extends Bloc<GetMedicalRecordsEvent, GetMedicalRecordsState> {
  final MedicalRecordRepository _medicalRecordRepository;
  int currentPage = 1;
  bool isNext = false;
  GetMedicalRecordsBloc(
    this._medicalRecordRepository,
  ) : super(const _Initial()) {
    on<_GetFirst>((event, emit) async {
      emit(const _Loading());
      currentPage = 1;

      GetMedicalRecords getMedicalRecords = GetMedicalRecords(medicalRecordRepository: _medicalRecordRepository);

      final result = await getMedicalRecords(
        GetMrParams(
          record: event.record,
          page: currentPage,
        ),
      );

      switch (result) {
        case Success(value: final medicalRecords):
          isNext = medicalRecords.length == 20;
          currentPage = currentPage + 1;
          emit(_Success(
            medicalRecords: medicalRecords,
            isNext: isNext,
          ));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });

    on<_GetNext>((event, emit) async {
      List<MedicalRecord> currentValue = state.whenOrNull(
            success: (medicalRecords, isNext) => medicalRecords.map((e) => e).toList(),
          ) ??
          [];

      GetMedicalRecords getMedicalRecords = GetMedicalRecords(
        medicalRecordRepository: _medicalRecordRepository,
      );

      final result = await getMedicalRecords(
        GetMrParams(
          record: event.record,
          page: currentPage,
        ),
      );

      switch (result) {
        case Success(value: final medicalRecords):
          isNext = medicalRecords.length == 20;
          currentPage = currentPage + 1;
          emit(_Success(
            medicalRecords: [...currentValue, ...medicalRecords],
            isNext: isNext,
          ));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
