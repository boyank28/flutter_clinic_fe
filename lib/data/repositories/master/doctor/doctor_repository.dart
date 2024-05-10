import 'package:flutter_clinic/domain/entities/doctor.dart';
import 'package:flutter_clinic/domain/entities/result.dart';

abstract interface class DoctorRepository {
  Future<Result<List<Doctor>>> getAll({
    required String? name,
    required int page,
  });

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
  });

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
  });

  Future<Result<String>> delete({required int id});
}
