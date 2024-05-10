import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';

import '../../../domain/entities/result.dart';

abstract interface class SatuSehatRepository {
  Future<Result<String>> getToken();

  Future<Result<List<Region>>> getProvinces({required String? codes});

  Future<Result<List<Region>>> getCities({required String? provinceCodes});

  Future<Result<List<Region>>> getDistricts({required String? cityCodes});

  Future<Result<List<Region>>> getSubDistricts({required String? districtCodes});
}
