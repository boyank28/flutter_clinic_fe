// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/doctor_schedule/doctor_schedule_repository.dart';
import 'package:flutter_clinic/domain/entities/doctor_schedule.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/master/doctor_schedule/update_doctor_schedule/update_doctor_schedule.dart';
import '../../../../../domain/usecases/master/doctor_schedule/update_doctor_schedule/update_doctor_schedule_params.dart';

part 'update_doctor_schedule_bloc.freezed.dart';
part 'update_doctor_schedule_event.dart';
part 'update_doctor_schedule_state.dart';

class UpdateDoctorScheduleBloc extends Bloc<UpdateDoctorScheduleEvent, UpdateDoctorScheduleState> {
  final DoctorScheduleRepository _doctorScheduleRepository;
  UpdateDoctorScheduleBloc(
    this._doctorScheduleRepository,
  ) : super(const _Initial()) {
    on<_UpdateById>((event, emit) async {
      emit(const _Loading());

      UpdateDoctorSchedule updateDoctorSchedule = UpdateDoctorSchedule(
        doctorScheduleRepository: _doctorScheduleRepository,
      );

      final result = await updateDoctorSchedule(
        UpdateDoctorScheduleParams(
          id: event.id,
          doctorId: event.doctorId,
          start: event.start,
          end: event.end,
          day: event.day,
          note: event.note,
          status: event.status,
        ),
      );

      switch (result) {
        case Success(value: final doctorSchedule):
          emit(_Success(doctorSchedule: doctorSchedule));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
