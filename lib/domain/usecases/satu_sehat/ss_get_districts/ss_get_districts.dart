import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

import '../../../../data/repositories/satu_sehat/satu_sehat_repository.dart';
import 'ss_get_districts_params.dart';

class SSGetDistricts implements Usecase<Result<List<Region>>, SSGetDistrictsParams> {
  final SatuSehatRepository _satuSehatRepository;

  SSGetDistricts({required SatuSehatRepository satuSehatRepository}) : _satuSehatRepository = satuSehatRepository;

  @override
  Future<Result<List<Region>>> call(SSGetDistrictsParams params) async {
    final result = await _satuSehatRepository.getDistricts(
      cityCodes: params.cityCodes,
    );

    return switch (result) {
      Success(value: final regions) => Result.success(regions),
      Failed(:final message) => Result.failed(message),
    };
  }
}
