import 'package:dio/dio.dart';
import 'package:flutter_clinic/data/repositories/master/patient/patient_repositories.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../auth/auth_local_datasource.dart';

class PatientExternalDatasource implements PatientRepository {
  final Dio _dio;

  PatientExternalDatasource({Dio? dio}) : _dio = dio ?? Dio();

  String baseUrl = dotenv.get('BASE_URL');

  @override
  Future<Result<Patient>> create(
      {required String nik,
      required String noKk,
      required String name,
      required String phone,
      required String? email,
      required String gender,
      required String birthPlace,
      required DateTime birthDate,
      required String addressLine,
      required String city,
      required String cityCode,
      required String province,
      required String provinceCode,
      required String district,
      required String districtCode,
      required String village,
      required String villageCode,
      required String rt,
      required String rw,
      required String postalCode,
      required String maritalStatus,
      required String? relationshipName,
      required String? relationshipPhone,
      required int isDeceased}) async {
    try {
      String apiUrl = '$baseUrl/api-patients';
      String? token = await AuthLocalDatasource().getToken();

      FormData patientRequest = FormData.fromMap({
        'nik': nik,
        'no_kk': noKk,
        'name': name,
        'phone': phone,
        'email': email,
        'gender': gender,
        'birth_place': birthPlace,
        'birth_date': birthDate,
        'address_line': addressLine,
        'city': city,
        'city_code': cityCode,
        'province': province,
        'province_code': provinceCode,
        'district': district,
        'district_code': districtCode,
        'village': village,
        'village_code': villageCode,
        'rt': rt,
        'rw': rw,
        'postal_code': postalCode,
        'marital_status': maritalStatus,
        'relationship_name': relationshipName,
        'relationship_phone': relationshipPhone,
        'is_deceased': isDeceased,
      });

      final response = await _dio.post(
        apiUrl,
        data: patientRequest,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      var result = response.data;

      if (result['status'] == true) {
        return Result.success(Patient.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<String>> delete({required int id}) async {
    try {
      String apiUrl = '$baseUrl/api-patients/$id';
      String? token = await AuthLocalDatasource().getToken();

      final response = await _dio.delete(
        apiUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final result = response.data;

      if (result['status'] == true) {
        return Result.success(result['message']);
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<List<Patient>>> getAll({
    required String patient,
    required int page,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-patients?patient=$patient&page=$page';
      String? token = await AuthLocalDatasource().getToken();

      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: {'Accept': 'application/json', 'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
        ),
      );

      final result = response.data;
      var patients = List<Map<String, dynamic>>.from(result['data']);

      if (result['status'] == true) {
        return Result.success(patients.map((e) => Patient.fromJson(e)).toList());
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.statusMessage?[1] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<Patient>> show({required int id}) async {
    try {
      String apiUrl = '$baseUrl/api-patients/$id';
      String? token = await AuthLocalDatasource().getToken();

      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final result = response.data;

      if (result['status'] == true) {
        return Result.success(Patient.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<Patient>> update(
      {required int id,
      required String nik,
      required String noKk,
      required String name,
      required String phone,
      required String? email,
      required String gender,
      required String birthPlace,
      required DateTime birthDate,
      required String addressLine,
      required String city,
      required String cityCode,
      required String province,
      required String provinceCode,
      required String district,
      required String districtCode,
      required String village,
      required String villageCode,
      required String rt,
      required String rw,
      required String postalCode,
      required String maritalStatus,
      required String? relationshipName,
      required String? relationshipPhone,
      required int isDeceased}) async {
    try {
      String apiUrl = '$baseUrl/api-patients/$id';
      String? token = await AuthLocalDatasource().getToken();

      FormData patientRequest = FormData.fromMap({
        'nik': nik,
        'no_kk': noKk,
        'name': name,
        'phone': phone,
        'email': email,
        'gender': gender,
        'birth_place': birthPlace,
        'birth_date': birthDate,
        'address_line': addressLine,
        'city': city,
        'city_code': cityCode,
        'province': province,
        'province_code': provinceCode,
        'district': district,
        'district_code': districtCode,
        'village': village,
        'village_code': villageCode,
        'rt': rt,
        'rw': rw,
        'postal_code': postalCode,
        'marital_status': maritalStatus,
        'relationship_name': relationshipName,
        'relationship_phone': relationshipPhone,
        'is_deceased': isDeceased,
        '_method': 'PATCH',
      });

      final response = await _dio.post(
        apiUrl,
        data: patientRequest,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      var result = response.data;

      // Bug, gatau kenapa callback is_deceased menjadi string, bukan int
      // Jadi harus di parsing manual
      result['data']['is_deceased'] = int.parse(result['data']['is_deceased']);

      if (result['status'] == true) {
        return Result.success(Patient.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }
}
