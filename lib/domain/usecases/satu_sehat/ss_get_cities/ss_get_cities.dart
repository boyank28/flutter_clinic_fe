import 'package:flutter_clinic/data/repositories/satu_sehat/satu_sehat_repository.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';
import 'package:flutter_clinic/domain/usecases/satu_sehat/ss_get_cities/ss_get_cities_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class SSGetCities implements Usecase<Result<List<Region>>, SSGetCitiesParams> {
  final SatuSehatRepository _satuSehatRepository;

  SSGetCities({required SatuSehatRepository satuSehatRepository}) : _satuSehatRepository = satuSehatRepository;

  @override
  Future<Result<List<Region>>> call(SSGetCitiesParams params) async {
    final result = await _satuSehatRepository.getCities(
      provinceCodes: params.provinceCodes,
    );

    return switch (result) {
      Success(value: final regions) => Result.success(regions),
      Failed(:final message) => Result.failed(message),
    };
  }
}
