// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor_schedule/delete_doctor_schedule/delete_doctor_schedule.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor_schedule/delete_doctor_schedule/delete_doctor_schedule_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/doctor_schedule/doctor_schedule_repository.dart';

part 'delete_doctor_schedule_bloc.freezed.dart';
part 'delete_doctor_schedule_event.dart';
part 'delete_doctor_schedule_state.dart';

class DeleteDoctorScheduleBloc extends Bloc<DeleteDoctorScheduleEvent, DeleteDoctorScheduleState> {
  final DoctorScheduleRepository _doctorScheduleRepository;
  DeleteDoctorScheduleBloc(
    this._doctorScheduleRepository,
  ) : super(const _Initial()) {
    on<_DeleteById>((event, emit) async {
      emit(const _Loading());

      DeleteDoctorSchedule deleteDoctorSchedule = DeleteDoctorSchedule(
        doctorScheduleRepository: _doctorScheduleRepository,
      );

      final result = await deleteDoctorSchedule(DeleteDoctorScheduleParams(id: event.id));

      switch (result) {
        case Success(value: final message):
          emit(_Success(message: message));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
