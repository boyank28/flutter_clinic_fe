// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/doctor/doctor_repository.dart';
import 'package:flutter_clinic/domain/entities/doctor.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/create_doctor/create_doctor.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/create_doctor/create_doctor_params.dart';

import '../../../../../domain/entities/result.dart';

part 'create_doctor_bloc.freezed.dart';
part 'create_doctor_event.dart';
part 'create_doctor_state.dart';

class CreateDoctorBloc extends Bloc<CreateDoctorEvent, CreateDoctorState> {
  final DoctorRepository _doctorRepository;
  CreateDoctorBloc(
    this._doctorRepository,
  ) : super(const _Initial()) {
    on<_DoCreate>(
      (event, emit) async {
        emit(const CreateDoctorState.loading());

        CreateDoctor createDoctor = CreateDoctor(doctorRepository: _doctorRepository);

        var result = await createDoctor(
          CreateDoctorParams(
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
            emit(CreateDoctorState.success(doctor: doctor));
            break;
          case Failed(:final message):
            emit(CreateDoctorState.failed(message: message));
            break;
        }
      },
    );
  }
}
