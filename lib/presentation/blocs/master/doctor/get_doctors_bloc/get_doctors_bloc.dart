// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/get_doctors/get_doctors.dart';
import 'package:flutter_clinic/domain/usecases/master/doctor/get_doctors/get_doctors_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/master/doctor/doctor_repository.dart';

import '../../../../../domain/entities/doctor.dart';
import '../../../../../domain/entities/result.dart';

part 'get_doctors_bloc.freezed.dart';
part 'get_doctors_event.dart';
part 'get_doctors_state.dart';

class GetDoctorsBloc extends Bloc<GetDoctorsEvent, GetDoctorsState> {
  final DoctorRepository _doctorRepository;
  int currentPage = 1;
  bool isNext = false;
  GetDoctorsBloc(
    this._doctorRepository,
  ) : super(const _Initial()) {
    on<_GetFirst>((event, emit) async {
      emit(const GetDoctorsState.loading());
      currentPage = 1;

      GetDoctors getDoctors = GetDoctors(doctorRepository: _doctorRepository);

      var result = await getDoctors(GetDoctorsParams(
        name: event.name,
        page: currentPage,
      ));

      switch (result) {
        case Success(value: final doctors):
          isNext = doctors.length == 50;
          currentPage = currentPage + 1;
          emit(GetDoctorsState.success(doctors: doctors, isNext: isNext));
          break;
        case Failed(:final message):
          emit(GetDoctorsState.failed(message: message));
          break;
      }
    });

    on<_GetNext>((event, emit) async {
      List<Doctor> currentValue = state.whenOrNull(success: (doctors, isNext) => doctors)?.map((e) => e).toList() ?? [];

      GetDoctors getDoctors = GetDoctors(doctorRepository: _doctorRepository);

      var result = await getDoctors(GetDoctorsParams(
        name: event.name,
        page: currentPage,
      ));

      switch (result) {
        case Success(value: final doctors):
          isNext = doctors.length == 50;
          currentPage = currentPage + 1;
          emit(GetDoctorsState.success(
            doctors: [...currentValue, ...doctors],
            isNext: isNext,
          ));
          break;
        case Failed(:final message):
          emit(GetDoctorsState.failed(message: message));
          break;
      }
    });
  }
}
