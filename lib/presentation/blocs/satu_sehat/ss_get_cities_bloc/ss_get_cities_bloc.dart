// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/satu_sehat/ss_get_cities/ss_get_cities.dart';
import 'package:flutter_clinic/domain/usecases/satu_sehat/ss_get_cities/ss_get_cities_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/satu_sehat/satu_sehat_repository.dart';

import '../../../../domain/entities/satu_sehat/region.dart';

part 'ss_get_cities_bloc.freezed.dart';
part 'ss_get_cities_event.dart';
part 'ss_get_cities_state.dart';

class SsGetCitiesBloc extends Bloc<SsGetCitiesEvent, SsGetCitiesState> {
  final SatuSehatRepository _satuSehatRepository;
  SsGetCitiesBloc(
    this._satuSehatRepository,
  ) : super(const _Initial()) {
    on<_DoGet>((event, emit) async {
      emit(const _Loading());

      SSGetCities ssGetCities = SSGetCities(satuSehatRepository: _satuSehatRepository);

      final result = await ssGetCities(
        SSGetCitiesParams(
          provinceCodes: event.provinceCodes,
        ),
      );

      Region unselected = Region(
        code: '0',
        parentCode: '0',
        name: 'Pilih Kota',
        bpsCode: '0',
      );

      switch (result) {
        case Success(value: final cities):
          emit(_Success(cities: cities..insert(0, unselected)));
          break;
        case Failed(message: final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
