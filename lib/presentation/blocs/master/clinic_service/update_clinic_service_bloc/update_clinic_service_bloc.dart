// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/update_clinic_servce/update_clinic_service.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/update_clinic_servce/update_clinic_service_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/domain/entities/clinic_service.dart';

import '../../../../../data/repositories/master/clinic_service/clinic_service_repository.dart';

part 'update_clinic_service_bloc.freezed.dart';
part 'update_clinic_service_event.dart';
part 'update_clinic_service_state.dart';

class UpdateClinicServiceBloc extends Bloc<UpdateClinicServiceEvent, UpdateClinicServiceState> {
  final ClinicServiceRepository _clinicServiceRepository;
  UpdateClinicServiceBloc(
    this._clinicServiceRepository,
  ) : super(const _Initial()) {
    on<_UpdateById>((event, emit) async {
      emit(const _Loading());

      UpdateClinicService updateClinicService = UpdateClinicService(clinicServiceRepository: _clinicServiceRepository);

      final result = await updateClinicService(
        UpdateClinicServiceParams(
          id: event.id,
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
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
