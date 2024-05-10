// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/get_clinic_services/get_clinic_service.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/get_clinic_services/get_clinic_service_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/clinic_service/clinic_service_repository.dart';

import '../../../../../domain/entities/clinic_service.dart';

part 'get_clinic_services_bloc.freezed.dart';
part 'get_clinic_services_event.dart';
part 'get_clinic_services_state.dart';

class GetClinicServicesBloc extends Bloc<GetClinicServicesEvent, GetClinicServicesState> {
  final ClinicServiceRepository _clinicServiceRepository;
  GetClinicServicesBloc(
    this._clinicServiceRepository,
  ) : super(const _Initial()) {
    on<_GetAll>((event, emit) async {
      List<ClinicService> currentData = List.from(state.whenOrNull(success: (clinicServices) => clinicServices) ?? []);

      emit(_Loading(clinicServices: currentData));

      GetClinicService getClinicService = GetClinicService(clinicServiceRepository: _clinicServiceRepository);

      final result = await getClinicService(GetClinicServiceParams(name: event.name));

      switch (result) {
        case Success(value: final clinicServices):
          if (currentData.isNotEmpty) {
            for (var data in clinicServices) {
              for (var selected in currentData) {
                if (data.id == selected.id) {
                  data.isChecked = selected.isChecked;
                  data.qty = selected.qty;
                  data.subtotal = selected.subtotal;
                  break;
                }
              }
            }
          }
          emit(_Success(clinicServices: clinicServices));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });

    on<_CheckedToggle>((event, emit) {
      List<ClinicService> currentData = List.from(state.whenOrNull(success: (clinicServices) => clinicServices) ?? []);
      ClinicService updateData = currentData[event.index].copyWith(isChecked: event.value);

      currentData.replaceRange(event.index, event.index + 1, [updateData]);

      emit(_Success(clinicServices: currentData));
    });

    on<_ClearChecked>((event, emit) {
      List<ClinicService> currentData = List.from(state.whenOrNull(success: (clinicServices) => clinicServices) ?? []);

      if (currentData.isNotEmpty) {
        for (var element in currentData) {
          element.isChecked = false;
          element.qty = 1;
          // log('${element.isChecked}');
        }
      }

      emit(_Success(clinicServices: currentData));
    });

    on<_IncreaseQty>((event, emit) {
      // Ambil list berdasarkan state terakhir
      List<ClinicService> currentData = List.from(state.whenOrNull(success: (clinicServices) => clinicServices) ?? []);

      // Ambil single data berdasarkan id yang di kirim
      ClinicService dataById = currentData.where((element) => element.id == event.id).first;

      int qty = ++dataById.qty;
      int subtotal = dataById.price * qty;

      ClinicService updateData = dataById.copyWith(
        qty: qty,
        subtotal: subtotal,
      );

      currentData.replaceRange(
        currentData.indexWhere((element) => element.id == event.id),
        currentData.indexWhere((element) => element.id == event.id) + 1,
        [updateData],
      );

      emit(_Success(clinicServices: currentData));
    });

    on<_DecreaseQty>((event, emit) {
      List<ClinicService> currentData = List.from(state.whenOrNull(success: (clinicServices) => clinicServices) ?? []);
      ClinicService dataById = currentData.where((element) => element.id == event.id).first;

      if (dataById.qty > 1) {
        int qty = --dataById.qty;
        int subtotal = dataById.price * qty;

        ClinicService updateData = dataById.copyWith(
          qty: qty,
          subtotal: subtotal,
        );

        currentData.replaceRange(
          currentData.indexWhere((element) => element.id == event.id),
          currentData.indexWhere((element) => element.id == event.id) + 1,
          [updateData],
        );
      }

      emit(_Success(clinicServices: currentData));
    });
  }
}
