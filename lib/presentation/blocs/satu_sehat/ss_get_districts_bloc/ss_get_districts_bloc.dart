// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/usecases/satu_sehat/ss_get_districts/ss_get_districts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/satu_sehat/satu_sehat_repository.dart';

import '../../../../domain/entities/result.dart';
import '../../../../domain/entities/satu_sehat/region.dart';
import '../../../../domain/usecases/satu_sehat/ss_get_districts/ss_get_districts_params.dart';

part 'ss_get_districts_bloc.freezed.dart';
part 'ss_get_districts_event.dart';
part 'ss_get_districts_state.dart';

class SsGetDistrictsBloc extends Bloc<SsGetDistrictsEvent, SsGetDistrictsState> {
  final SatuSehatRepository _satuSehatRepository;
  SsGetDistrictsBloc(
    this._satuSehatRepository,
  ) : super(const _Initial()) {
    on<_DoGet>(
      (event, emit) async {
        emit(const _Loading());

        SSGetDistricts ssGetDistricts = SSGetDistricts(satuSehatRepository: _satuSehatRepository);

        final result = await ssGetDistricts(
          SSGetDistrictsParams(
            cityCodes: event.cityCodes,
          ),
        );

        Region unselected = Region(
          code: '0',
          parentCode: '0',
          name: 'Pilih Kecamatan',
          bpsCode: '0',
        );

        switch (result) {
          case Success(value: final districts):
            emit(_Success(districts: districts..insert(0, unselected)));
            break;
          case Failed(message: final message):
            emit(_Failed(message: message));
            break;
        }
      },
    );
  }
}
