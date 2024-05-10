// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/delete_doctor/delete_doctor.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/delete_doctor/delete_doctor_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/doctor/doctor_repository.dart';

part 'delete_doctor_bloc.freezed.dart';
part 'delete_doctor_event.dart';
part 'delete_doctor_state.dart';

class DeleteDoctorBloc extends Bloc<DeleteDoctorEvent, DeleteDoctorState> {
  final DoctorRepository _doctorRepository;
  DeleteDoctorBloc(
    this._doctorRepository,
  ) : super(const _Initial()) {
    on<_DoDelete>(
      (event, emit) async {
        emit(const DeleteDoctorState.loading());

        DeleteDoctor deleteDoctor = DeleteDoctor(doctorRepository: _doctorRepository);

        final result = await deleteDoctor(DeleteDoctorParams(id: event.id));

        switch (result) {
          case Success(value: final message):
            emit(_Success(message: message));
            break;
          case Failed(:final message):
            emit(_Failed(message: message));
            break;
        }
      },
    );
  }
}
