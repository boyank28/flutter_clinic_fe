// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/usecases/satu_sehat/ss_get_provinces/ss_get_provinces.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/satu_sehat/satu_sehat_repository.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';

import '../../../../domain/entities/result.dart';
import '../../../../domain/usecases/satu_sehat/ss_get_provinces/ss_get_provinces_params.dart';

part 'ss_get_provinces_bloc.freezed.dart';
part 'ss_get_provinces_event.dart';
part 'ss_get_provinces_state.dart';

class SsGetProvincesBloc extends Bloc<SsGetProvincesEvent, SsGetProvincesState> {
  final SatuSehatRepository _satuSehatRepository;
  SsGetProvincesBloc(
    this._satuSehatRepository,
  ) : super(const _Initial()) {
    on<_DoGet>(
      (event, emit) async {
        emit(const _Loading());

        SSGetProvinces ssGetProvinces = SSGetProvinces(
          satuSehatRepository: _satuSehatRepository,
        );

        final result = await ssGetProvinces(
          SSGetProvincesParams(
            codes: event.codes,
          ),
        );

        Region unselected = Region(
          code: '0',
          parentCode: '0',
          name: 'Pilih Provinsi',
          bpsCode: '0',
        );

        switch (result) {
          case Success(value: final provinces):
            emit(_Success(provinces: provinces..insert(0, unselected)));
            break;
          case Failed(message: final message):
            emit(_Failed(message: message));
            break;
        }
      },
    );
  }
}
