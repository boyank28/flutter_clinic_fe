// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/update_patient/update_patient.dart';
import 'package:flutter_clinic/domain/usecases/master/patient/update_patient/update_patient_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';

part 'update_patient_bloc.freezed.dart';
part 'update_patient_event.dart';
part 'update_patient_state.dart';

class UpdatePatientBloc extends Bloc<UpdatePatientEvent, UpdatePatientState> {
  final PatientRepository _patientRepository;
  UpdatePatientBloc(
    this._patientRepository,
  ) : super(const _Initial()) {
    on<_UpdateById>(
      (event, emit) async {
        emit(const _Loading());

        UpdatePatient updatePatient = UpdatePatient(patientRepository: _patientRepository);

        final result = await updatePatient(
          UpdatePatientParams(
            id: event.id,
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
