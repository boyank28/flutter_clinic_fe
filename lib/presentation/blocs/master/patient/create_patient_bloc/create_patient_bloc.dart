// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/create_patient/create_patient_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/create_patient/create_patient.dart';

part 'create_patient_bloc.freezed.dart';
part 'create_patient_event.dart';
part 'create_patient_state.dart';

class CreatePatientBloc extends Bloc<CreatePatientEvent, CreatePatientState> {
  final PatientRepository _patientRepository;
  CreatePatientBloc(
    this._patientRepository,
  ) : super(const _Initial()) {
    on<_DoCreate>(
      (event, emit) async {
        emit(const _Loading());

        CreatePatient createPatient = CreatePatient(patientRepository: _patientRepository);

        final result = await createPatient(
          CreatePatientParams(
            nik: event.nik,
            noKk: event.noKk,
            name: event.name,
            phone: event.phone,
            email: event.email,
            gender: event.gender,
            birthPlace: event.birthPlace,
            birthDate: event.birthDate,
            addressLine: event.addressLine,
            city: event.city,
            cityCode: event.cityCode,
            province: event.province,
            provinceCode: event.provinceCode,
            district: event.district,
            districtCode: event.districtCode,
            village: event.village,
            villageCode: event.villageCode,
            rt: event.rt,
            rw: event.rw,
            postalCode: event.postalCode,
            maritalStatus: event.maritalStatus,
            relationshipName: event.relationshipName,
            relationshipPhone: event.relationshipPhone,
            isDeceased: event.isDeceased,
          ),
        );

        switch (result) {
          case Success(value: final patient):
            emit(_Success(patient: patient));
            break;
          case Failed(:final message):
            emit(_Failed(message: message));
            break;
        }
      },
    );
  }
}
