// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_clinic/data/datasources/auth/auth_local_datasource.dart';
import 'package:flutter_clinic/data/repositories/master/doctor/doctor_repository.dart';
import 'package:flutter_clinic/domain/entities/doctor.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path/path.dart' as p;

class DoctorExternalDatasource implements DoctorRepository {
  final Dio _dio;

  DoctorExternalDatasource({Dio? dio}) : _dio = dio ?? Dio();

  String baseUrl = dotenv.get('BASE_URL');

  @override
  Future<Result<Doctor>> create({
    required String name,
    required String? nik,
    required String sip,
    required String? idIhs,
    required String specialization,
    required String? address,
    required String email,
    required String phone,
    required String? photo,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-doctors';
      String? token = await AuthLocalDatasource().getToken();

      FormData doctorRequest = FormData.fromMap(
        {
          'name': name,
          'nik': nik,
          'sip': sip,
          'id_ihs': idIhs,
          'specialization': specialization,
          'address': address,
          'email': email,
          'phone': phone,
          'photo': photo == null
              ? null
              : await MultipartFile.fromFile(
                  File(photo).path,
                  filename: p.basename(photo),
                ),
        },
      );

      final response = await _dio.post(
        apiUrl,
        data: doctorRequest,
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
        return Result.success(Doctor.fromJson(result['data']));
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
      String apiUrl = '$baseUrl/api-doctors/$id';
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

      var result = response.data;

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
  Future<Result<List<Doctor>>> getAll({
    required String? name,
    required int page,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-doctors?name=$name&page=$page';
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
        return Result.success((data.map((e) => Doctor.fromJson(e))).toList());
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<Doctor>> update({
    required int id,
    required String? name,
    required String? nik,
    required String? sip,
    required String? idIhs,
    required String? specialization,
    required String? address,
    required String? email,
    required String? phone,
    required String? photo,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-doctors/$id';
      String? token = await AuthLocalDatasource().getToken();

      final response = await _dio.post(
        apiUrl,
        data: FormData.fromMap(
          photo == null
              ? {
                  'name': name,
                  'nik': nik,
                  'sip': sip,
                  'id_ihs': idIhs,
                  'specialization': specialization,
                  'address': address,
                  'email': email,
                  'phone': phone,
                  '_method': 'PUT',
                }
              : {
                  'name': name,
                  'nik': nik,
                  'sip': sip,
                  'id_ihs': idIhs,
                  'specialization': specialization,
                  'address': address,
                  'email': email,
                  'phone': phone,
                  'photo': await MultipartFile.fromFile(
                    File(photo).path,
                    filename: p.basename(photo),
                  ),
                  '_method': 'PUT',
                },
        ),
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
        return Result.success(Doctor.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }
}
