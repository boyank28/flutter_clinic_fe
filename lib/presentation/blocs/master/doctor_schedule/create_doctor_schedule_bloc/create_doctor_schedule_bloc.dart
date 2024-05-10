// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor_schedule/create_doctor_schedule/create_doctor_schedule.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor_schedule/create_doctor_schedule/create_doctor_schedule_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/doctor_schedule/doctor_schedule_repository.dart';

import '../../../../../domain/entities/doctor_schedule.dart';

part 'create_doctor_schedule_bloc.freezed.dart';
part 'create_doctor_schedule_event.dart';
part 'create_doctor_schedule_state.dart';

class CreateDoctorScheduleBloc extends Bloc<CreateDoctorScheduleEvent, CreateDoctorScheduleState> {
  final DoctorScheduleRepository _doctorScheduleRepository;
  CreateDoctorScheduleBloc(
    this._doctorScheduleRepository,
  ) : super(const _Initial()) {
    on<_DoCreate>((event, emit) async {
      emit(const _Loading());

      CreateDoctorSchedule createDoctorSchedule = CreateDoctorSchedule(
        doctorScheduleRepository: _doctorScheduleRepository,
      );

      final result = await createDoctorSchedule(
        CreateDoctorScheduleParams(
          doctorId: event.doctorId,
          start: event.start,
          end: event.end,
          day: event.day,
          status: event.status,
          note: event.note,
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
