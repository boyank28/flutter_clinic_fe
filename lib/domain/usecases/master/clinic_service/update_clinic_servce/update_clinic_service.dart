import 'package:flutter_clinic/data/repositories/master/clinic_service/clinic_service_repository.dart';
import 'package:flutter_clinic/domain/entities/clinic_service.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/update_clinic_servce/update_clinic_service_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class UpdateClinicService implements Usecase<Result<ClinicService>, UpdateClinicServiceParams> {
  final ClinicServiceRepository _clinicServiceRepository;

  UpdateClinicService({required ClinicServiceRepository clinicServiceRepository})
      : _clinicServiceRepository = clinicServiceRepository;

  @override
  Future<Result<ClinicService>> call(UpdateClinicServiceParams params) async {
    final result = await _clinicServiceRepository.update(
      id: params.id,
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
