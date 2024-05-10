import 'package:flutter_clinic/data/repositories/satu_sehat/satu_sehat_repository.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';
import 'package:flutter_clinic/domain/usecases/satu_sehat/ss_get_provinces/ss_get_provinces_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class SSGetProvinces implements Usecase<Result<List<Region>>, SSGetProvincesParams> {
  final SatuSehatRepository _satuSehatRepository;

  SSGetProvinces({required SatuSehatRepository satuSehatRepository}) : _satuSehatRepository = satuSehatRepository;

  @override
  Future<Result<List<Region>>> call(SSGetProvincesParams params) async {
    final result = await _satuSehatRepository.getProvinces(
      codes: params.codes,
    );

    return switch (result) {
      Success(value: final regions) => Result.success(regions),
      Failed(:final message) => Result.failed(message),
    };
  }
}
