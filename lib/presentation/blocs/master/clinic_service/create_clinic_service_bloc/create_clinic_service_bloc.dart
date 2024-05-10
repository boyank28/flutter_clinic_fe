// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/create_clinic_service/create_clinic_service.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/create_clinic_service/create_clinic_service_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/clinic_service/clinic_service_repository.dart';
import 'package:flutter_clinic/domain/entities/clinic_service.dart';

part 'create_clinic_service_bloc.freezed.dart';
part 'create_clinic_service_event.dart';
part 'create_clinic_service_state.dart';

class CreateClinicServiceBloc extends Bloc<CreateClinicServiceEvent, CreateClinicServiceState> {
  final ClinicServiceRepository _clinicServiceRepository;
  CreateClinicServiceBloc(
    this._clinicServiceRepository,
  ) : super(const _Initial()) {
    on<_DoCreate>((event, emit) async {
      emit(const _Loading());

      CreateClinicService createClinicService = CreateClinicService(clinicServiceRepository: _clinicServiceRepository);

      final result = await createClinicService(
        CreateClinicServiceParams(
          name: event.name,
          category: event.category,
          price: event.price,
          qty: event.qty,
        ),
      );

      switch (result) {
        case Success(value: final clinicService):
          emit(_Success(clinicService: clinicService));
          break;
        case Failed(message: final message):
          emit(CreateClinicServiceState.failed(message: message));
          break;
      }
    });
  }
}
