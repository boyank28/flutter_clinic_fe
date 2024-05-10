// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/delete_clinic_service/delete_clinic_service.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/delete_clinic_service/delete_clinic_service_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/clinic_service/clinic_service_repository.dart';

part 'delete_clinic_service_bloc.freezed.dart';
part 'delete_clinic_service_event.dart';
part 'delete_clinic_service_state.dart';

class DeleteClinicServiceBloc extends Bloc<DeleteClinicServiceEvent, DeleteClinicServiceState> {
  final ClinicServiceRepository _clinicServiceRepository;
  DeleteClinicServiceBloc(
    this._clinicServiceRepository,
  ) : super(const _Initial()) {
    on<_DeleteById>((event, emit) async {
      emit(const _Loading());

      DeleteClinicService deleteClinicService = DeleteClinicService(clinicServiceRepository: _clinicServiceRepository);

      final result = await deleteClinicService(DeleteClinicServiceParams(id: event.id));

      switch (result) {
        case Success(value: final message):
          emit(_Success(message: message));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
      }
    });
  }
}
