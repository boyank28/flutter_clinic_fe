// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/update_doctor/update_doctor.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/update_doctor/update_doctor_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/doctor/doctor_repository.dart';
import 'package:flutter_clinic/domain/entities/doctor.dart';

import '../../../../../domain/entities/result.dart';

part 'update_doctor_bloc.freezed.dart';
part 'update_doctor_event.dart';
part 'update_doctor_state.dart';

class UpdateDoctorBloc extends Bloc<UpdateDoctorEvent, UpdateDoctorState> {
  final DoctorRepository _doctorRepository;
  UpdateDoctorBloc(
    this._doctorRepository,
  ) : super(const _Initial()) {
    on<_DoUpdate>(
      (event, emit) async {
        emit(const UpdateDoctorState.loading());

        UpdateDoctor updateDoctor = UpdateDoctor(doctorRepository: _doctorRepository);

        var result = await updateDoctor(
          UpdateDoctorParams(
            id: event.id,
            name: event.name,
            nik: event.nik,
            sip: event.sip,
            idIhs: event.idIhs,
            specialization: event.specialization,
            address: event.address,
            email: event.email,
            phone: event.phone,
            photo: event.photo,
          ),
        );

        switch (result) {
          case Success(value: final doctor):
            emit(UpdateDoctorState.success(doctor: doctor));
            break;
          case Failed(:final message):
            emit(UpdateDoctorState.failed(message: message));
            break;
        }
      },
    );
  }
}
