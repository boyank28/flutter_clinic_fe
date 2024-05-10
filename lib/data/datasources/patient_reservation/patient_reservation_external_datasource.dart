import 'package:dio/dio.dart';
import 'package:flutter_clinic/data/repositories/patient_reservation/patient_reservation_repository.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../auth/auth_local_datasource.dart';

class PatientReservationExternalDatasource implements PatientReservationRepository {
  final Dio _dio;

  PatientReservationExternalDatasource({Dio? dio}) : _dio = dio ?? Dio();

  String baseUrl = dotenv.get('BASE_URL');

  @override
  Future<Result<PatientReservation>> create({
    required int patientId,
    required int doctorId,
    required DateTime scheduleTime,
    required String complaint,
    required int queueNumber,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-patient-reservations';
      String? token = await AuthLocalDatasource().getToken();

      FormData reservationRequest = FormData.fromMap({
        'patient_id': patientId,
        'doctor_id': doctorId,
        'schedule_time': scheduleTime.toIso8601String(),
        'complaint': complaint,
        'queue_number': queueNumber,
      });

      final response = await _dio.post(
        apiUrl,
        data: reservationRequest,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      final result = response.data;
      result['data']['queue_number'] = int.parse(result['data']['queue_number']);

      if (result['status'] == true) {
        return Result.success(PatientReservation.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<List<PatientReservation>>> getAll({required String patient}) async {
    try {
      String apiUrl = '$baseUrl/api-patient-reservations?patient=$patient';
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
        return Result.success((data.map((e) => PatientReservation.fromJson(e))).toList());
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<PatientReservation>> cancelByID({
    required int id,
  }) async {
    try {
      final apiUrl = '$baseUrl/api-patient-reservations/cancel/$id';
      String? token = await AuthLocalDatasource().getToken();

      final response = await _dio.post(
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
        return Result.success(PatientReservation.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }
}
