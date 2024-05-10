// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor_schedule/get_doctor_schedules/get_doctor_schedules.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/doctor_schedule/doctor_schedule_repository.dart';

import '../../../../../domain/entities/doctor_schedule.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/master/doctor_schedule/get_doctor_schedules/get_doctor_schedules_params.dart';

part 'get_doctor_schedules_bloc.freezed.dart';
part 'get_doctor_schedules_event.dart';
part 'get_doctor_schedules_state.dart';

class GetDoctorSchedulesBloc extends Bloc<GetDoctorSchedulesEvent, GetDoctorSchedulesState> {
  final DoctorScheduleRepository _doctorScheduleRepository;
  GetDoctorSchedulesBloc(
    this._doctorScheduleRepository,
  ) : super(const _Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());

      GetDoctorSchedules getDoctorSchedules = GetDoctorSchedules(
        doctorScheduleRepository: _doctorScheduleRepository,
      );

      final result = await getDoctorSchedules(
        GetDoctorSchedulesParams(
          name: event.name,
        ),
      );

      switch (result) {
        case Success(value: final doctorSchedules):
          emit(_Success(doctorSchedules: doctorSchedules));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
