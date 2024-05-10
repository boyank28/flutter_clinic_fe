import 'package:flutter_clinic/data/repositories/master/clinic_service/clinic_service_repository.dart';
import 'package:flutter_clinic/domain/entities/clinic_service.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/get_clinic_services/get_clinic_service_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class GetClinicService implements Usecase<Result<List<ClinicService>>, GetClinicServiceParams> {
  final ClinicServiceRepository _clinicServiceRepository;

  GetClinicService({required ClinicServiceRepository clinicServiceRepository})
      : _clinicServiceRepository = clinicServiceRepository;

  @override
  Future<Result<List<ClinicService>>> call(GetClinicServiceParams params) async {
    final result = await _clinicServiceRepository.getAll(
      name: params.name,
    );

    return switch (result) {
      Success(value: final clinicServices) => Result.success(clinicServices),
      Failed(:final message) => Result.failed(message),
    };
  }
}
