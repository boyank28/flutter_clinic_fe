// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/satu_sehat/satu_sehat_repository.dart';

import '../../../../domain/entities/result.dart';
import '../../../../domain/entities/satu_sehat/region.dart';
import '../../../../domain/usecases/satu_sehat/ss_get_sub_districts/ss_get_sub_districts.dart';
import '../../../../domain/usecases/satu_sehat/ss_get_sub_districts/ss_get_sub_districts_params.dart';

part 'ss_get_sub_districts_bloc.freezed.dart';
part 'ss_get_sub_districts_event.dart';
part 'ss_get_sub_districts_state.dart';

class SsGetSubDistrictsBloc extends Bloc<SsGetSubDistrictsEvent, SsGetSubDistrictsState> {
  final SatuSehatRepository _satuSehatRepository;
  SsGetSubDistrictsBloc(
    this._satuSehatRepository,
  ) : super(const _Initial()) {
    on<_DoGet>(
      (event, emit) async {
        emit(const _Loading());

        SSGetSubDistricts ssGetSubDistricts = SSGetSubDistricts(satuSehatRepository: _satuSehatRepository);

        final result = await ssGetSubDistricts(
          SSGetSubDistrictsParams(
            districtCodes: event.districtCodes,
          ),
        );

        Region unselected = Region(
          code: '0',
          parentCode: '0',
          name: 'Pilih Kecamatan',
          bpsCode: '0',
        );

        switch (result) {
          case Success(value: final subDistricts):
            emit(_Success(subDistricts: subDistricts..insert(0, unselected)));
            break;
          case Failed(message: final message):
            emit(_Failed(message: message));
            break;
        }
      },
    );
  }
}
