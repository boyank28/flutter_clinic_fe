import 'package:flutter_clinic/data/repositories/satu_sehat/satu_sehat_repository.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';
import 'package:flutter_clinic/domain/usecases/satu_sehat/ss_get_sub_districts/ss_get_sub_districts_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class SSGetSubDistricts implements Usecase<Result<List<Region>>, SSGetSubDistrictsParams> {
  final SatuSehatRepository _satuSehatRepository;

  SSGetSubDistricts({required SatuSehatRepository satuSehatRepository}) : _satuSehatRepository = satuSehatRepository;

  @override
  Future<Result<List<Region>>> call(SSGetSubDistrictsParams params) async {
    final result = await _satuSehatRepository.getSubDistricts(
      districtCodes: params.districtCodes,
    );

    return switch (result) {
      Success(value: final regions) => Result.success(regions),
      Failed(:final message) => Result.failed(message),
    };
  }
}
