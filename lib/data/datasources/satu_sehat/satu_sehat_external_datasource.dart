import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_clinic/data/datasources/auth/auth_local_datasource.dart';
import 'package:flutter_clinic/data/datasources/satu_sehat/satu_sehat_local_datasource.dart';
import 'package:flutter_clinic/data/repositories/satu_sehat/satu_sehat_repository.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SatuSehatExternalDatasource implements SatuSehatRepository {
  final Dio _dio;

  SatuSehatExternalDatasource({Dio? dio}) : _dio = dio ?? Dio();

  String baseUrl = dotenv.get('BASE_URL');
  String baseUrlSatuSehat = dotenv.get('BASE_URL_SATU_SEHAT');

  @override
  Future<Result<List<Region>>> getCities({required String? provinceCodes}) async => await _getRegions(
        region: _RegionCategory.cities.toString(),
        codes: provinceCodes,
      );

  @override
  Future<Result<List<Region>>> getDistricts({required String? cityCodes}) async => await _getRegions(
        region: _RegionCategory.districts.toString(),
        codes: cityCodes,
      );

  @override
  Future<Result<List<Region>>> getProvinces({required String? codes}) async => await _getRegions(
        region: _RegionCategory.provinces.toString(),
        codes: codes,
      );

  @override
  Future<Result<List<Region>>> getSubDistricts({required String? districtCodes}) async => await _getRegions(
        region: _RegionCategory.subDistricts.toString(),
        codes: districtCodes,
      );

  Future<Result<List<Region>>> _getRegions({required String region, required String? codes}) async {
    try {
      String apiUrl = '$baseUrlSatuSehat/masterdata/v1/$region$codes';
      String? satuSehatToken = await SatuSehatLocalDatasource().getToken();

      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $satuSehatToken',
          },
        ),
      );

      final result = response.data;
      List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(result['data']);

      if (result['status'] == 200) {
        return Result.success(data.map((e) => Region.fromJson(e)).toList());
      } else {
        return Result.failed(result['fault']['faultString']);
      }
    } on DioException catch (e) {
      log('${e.response?.data}');
      return Result.failed(e.response?.data['fault']['faultstring'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<String>> getToken() async {
    try {
      String apiUrl = '$baseUrl/satusehat-token';
      String? token = await AuthLocalDatasource().getToken();

      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      var result = response.data;

      if (result['status'] == true) {
        await SatuSehatLocalDatasource().saveToken(result['data']);
        return Result.success(result['data']);
      } else {
        return const Result.failed('Gagal mendapatkan token Satu Sehat');
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }
}

enum _RegionCategory {
  provinces('provinces?codes='),
  cities('cities?province_codes='),
  districts('districts?city_codes='),
  subDistricts('sub-districts?district_codes=');

  final String _inString;

  const _RegionCategory(String inString) : _inString = inString;

  @override
  String toString() => _inString;
}
