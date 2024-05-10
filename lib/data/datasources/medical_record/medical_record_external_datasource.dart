import 'package:dio/dio.dart';
import 'package:flutter_clinic/data/datasources/auth/auth_local_datasource.dart';
import 'package:flutter_clinic/data/repositories/medical_record/medical_record_repository.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MedicalRecordExternalDatasource implements MedicalRecordRepository {
  final Dio _dio;

  MedicalRecordExternalDatasource({Dio? dio}) : _dio = dio ?? Dio();

  String baseUrl = dotenv.get('BASE_URL');

  @override
  Future<Result<MedicalRecord>> create(
      {required int patientReservationId,
      required String diagnosis,
      required String medicalTreatment,
      required String doctorNotes,
      required List<Map<String, dynamic>> medicalRecordServices}) async {
    try {
      String apiUrl = '$baseUrl/api-medical-records';
      String? token = await AuthLocalDatasource().getToken();

      FormData medicalRecordRequest = FormData.fromMap({
        'patient_reservation_id': patientReservationId,
        'diagnosis': diagnosis,
        'medical_treatment': medicalTreatment,
        'doctor_notes': doctorNotes,
        'medical_record_services': medicalRecordServices,
      });

      final response = await _dio.post(
        apiUrl,
        data: medicalRecordRequest,
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
        return Result.success(MedicalRecord.fromJson(result['data']));
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<List<MedicalRecord>>> getAll({
    required String record,
    required int page,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-medical-records?record=$record&page=$page';
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
      List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(result['data']);

      if (result['status'] == true) {
        return Result.success((data.map((e) => MedicalRecord.fromJson(e))).toList());
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }

  @override
  Future<Result<MedicalRecord>> getByReservationId({
    required int reservationId,
  }) async {
    try {
      String apiUrl = '$baseUrl/api-medical-records/$reservationId';
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

      MedicalRecord finalResult = MedicalRecord.fromJson(result['data']);

      for (var item in finalResult.medicalRecordServices) {
        item.clinicService.subtotal = item.clinicService.price * item.qty;
      }

      if (result['status'] == true) {
        return Result.success(finalResult);
      } else {
        return Result.failed(result['message']);
      }
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message'] ?? 'Internal Server Error');
    }
  }
}
