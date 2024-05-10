// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/medical_record/get_mr_by_reservation_id/get_mr_by_reservation_id.dart';
import 'package:flutter_clinic/domain/usecases/medical_record/get_mr_by_reservation_id/get_mr_by_reservation_id_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/medical_record/medical_record_repository.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';

part 'get_mr_by_reservation_id_bloc.freezed.dart';
part 'get_mr_by_reservation_id_event.dart';
part 'get_mr_by_reservation_id_state.dart';

class GetMrByReservationIdBloc extends Bloc<GetMrByReservationIdEvent, GetMrByReservationIdState> {
  final MedicalRecordRepository _medicalRecordRepository;
  GetMrByReservationIdBloc(
    this._medicalRecordRepository,
  ) : super(const _Initial()) {
    on<_DoGet>((event, emit) async {
      emit(const _Loading());

      GetMrByReservationId getMrByReservationId = GetMrByReservationId(
        medicalRecordRepository: _medicalRecordRepository,
      );

      final result = await getMrByReservationId(GetMrByReservationIdParams(
        reservationId: event.reservationId,
      ));

      switch (result) {
        case Success(value: final medicalRecord):
          emit(_Success(medicalRecord: medicalRecord));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
