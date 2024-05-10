import 'package:dio/dio.dart';
import 'package:flutter_clinic/data/datasources/auth/auth_local_datasource.dart';
import 'package:flutter_clinic/data/repositories/master/clinic_service/clinic_service_repository.dart';
import 'package:flutter_clinic/domain/entities/clinic_service.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ClinicServiceExternalDatasource implements ClinicServiceRepository {
  final Dio _dio;

  ClinicServiceExternalDatasource({Dio? dio}) : _dio = dio ?? Dio();

  String baseUrl = dotenv.get('BASE_URL');

  @override
  Future<Result<ClinicService>> create({
    required String name,
    required String category,
    required int price,
    required int qty,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-clinic-services';
      String? token = await AuthLocalDatasource().getToken();

      FormData serviceRequest = FormData.fromMap({
        'name': name,
        'category': category,
        'price': price,
        'qty': qty,
      });

      final response = await _dio.post(
        apiUrl,
        data: serviceRequest,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      final result = response.data;
      result['data']['price'] = int.parse(result['data']['price']);
      result['data']['qty'] = int.parse(result['data']['qty']);

      if (result['status'] == true) {
        return Result.success(ClinicService.fromJson(result['data']));
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
      String apiUrl = '$baseUrl/api-clinic-services/$id';
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
  Future<Result<List<ClinicService>>> getAll({
    required String name,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-clinic-services?name=$name';
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

      var result = response.data;
      var data = List<Map<String, dynamic>>.from(result['data']);

      if (result['status'] == true) {
        return Result.success((data.map((e) => ClinicService.fromJson({
              'id': e['id'],
              'name': e['name'],
              'category': e['category'],
              'price': e['price'],
              'qty': e['qty'],
              'subtotal': e['price'],
              'isChecked': false,
              'created_at': e['created_at'],
            }))).toList());
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<ClinicService>> update({
    required int id,
    required String name,
    required String category,
    required int price,
    required int qty,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-clinic-services/$id';
      String? token = await AuthLocalDatasource().getToken();

      FormData serviceRequest = FormData.fromMap({
        'name': name,
        'category': category,
        'price': price,
        'qty': qty,
        '_method': 'PUT',
      });

      final response = await _dio.post(
        apiUrl,
        data: serviceRequest,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final result = response.data;
      result['data']['price'] = int.parse(result['data']['price']);
      result['data']['qty'] = int.parse(result['data']['qty']);

      if (result['status'] == true) {
        return Result.success(ClinicService.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }
}
