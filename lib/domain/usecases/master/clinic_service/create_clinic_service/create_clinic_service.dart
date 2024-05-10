import 'package:flutter_clinic/data/repositories/master/clinic_service/clinic_service_repository.dart';
import 'package:flutter_clinic/domain/entities/clinic_service.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/create_clinic_service/create_clinic_service_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class CreateClinicService implements Usecase<Result<ClinicService>, CreateClinicServiceParams> {
  final ClinicServiceRepository _clinicServiceRepository;

  CreateClinicService({required ClinicServiceRepository clinicServiceRepository})
      : _clinicServiceRepository = clinicServiceRepository;

  @override
  Future<Result<ClinicService>> call(CreateClinicServiceParams params) async {
    final result = await _clinicServiceRepository.create(
      name: params.name,
      category: params.category,
      price: params.price,
      qty: params.qty,
    );

    return switch (result) {
      Success(value: final clinicService) => Result.success(clinicService),
      Failed(:final message) => Result.failed(message),
    };
  }
}
