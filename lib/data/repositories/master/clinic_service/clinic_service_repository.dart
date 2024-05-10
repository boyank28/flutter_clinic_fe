import 'package:flutter_clinic/domain/entities/clinic_service.dart';

import '../../../../domain/entities/result.dart';

abstract interface class ClinicServiceRepository {
  Future<Result<List<ClinicService>>> getAll({
    required String name,
  });

  Future<Result<ClinicService>> create({
    required String name,
    required String category,
    required int price,
    required int qty,
  });

  Future<Result<ClinicService>> update({
    required int id,
    required String name,
    required String category,
    required int price,
    required int qty,
  });

  Future<Result<String>> delete({
    required int id,
  });
}
