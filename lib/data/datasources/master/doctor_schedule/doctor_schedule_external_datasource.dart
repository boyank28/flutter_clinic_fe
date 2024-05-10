import 'package:dio/dio.dart';
import 'package:flutter_clinic/data/repositories/master/doctor_schedule/doctor_schedule_repository.dart';
import 'package:flutter_clinic/domain/entities/doctor_schedule.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../auth/auth_local_datasource.dart';

class DoctorScheduleExternalDatasource implements DoctorScheduleRepository {
  final Dio _dio;

  DoctorScheduleExternalDatasource({Dio? dio}) : _dio = dio ?? Dio();

  String baseUrl = dotenv.get('BASE_URL');

  @override
  Future<Result<DoctorSchedule>> create(
      {required int doctorId,
      required String start,
      required String end,
      required String day,
      required String status,
      required String note}) async {
    try {
      String apiUrl = '$baseUrl/api-doctor-schedules';
      String? token = await AuthLocalDatasource().getToken();

      FormData scheduleRequest = FormData.fromMap(
          {'doctor_id': doctorId, 'start': start, 'end': end, 'day': day, 'status': status, 'note': note});

      final response = await _dio.post(
        apiUrl,
        data: scheduleRequest,
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
        return Result.success(DoctorSchedule.fromJson(result['data']));
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
      String apiUrl = '$baseUrl/api-doctor-schedules/$id';
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
  Future<Result<List<DoctorSchedule>>> getAll({required String name}) async {
    try {
      String apiUrl = '$baseUrl/api-doctor-schedules?name=$name';
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
        return Result.success((data.map((e) => DoctorSchedule.fromJson(e))).toList());
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<DoctorSchedule>> update({
    required int id,
    required int doctorId,
    required String start,
    required String end,
    required String day,
    required String status,
    required String note,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-doctor-schedules/$id';
      String? token = await AuthLocalDatasource().getToken();

      FormData scheduleRequest = FormData.fromMap({
        'doctor_id': doctorId,
        'start': start,
        'end': end,
        'day': day,
        'status': status,
        'note': note,
      });

      final response = await _dio.put(
        apiUrl,
        data: scheduleRequest,
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
        return Result.success(DoctorSchedule.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }
}
