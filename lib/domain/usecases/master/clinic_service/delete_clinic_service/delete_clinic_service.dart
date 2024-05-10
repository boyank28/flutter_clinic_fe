import 'package:flutter_clinic/data/repositories/master/clinic_service/clinic_service_repository.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/master/clinic_service/delete_clinic_service/delete_clinic_service_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class DeleteClinicService implements Usecase<Result<String>, DeleteClinicServiceParams> {
  final ClinicServiceRepository _clinicServiceRepository;

  DeleteClinicService({required ClinicServiceRepository clinicServiceRepository})
      : _clinicServiceRepository = clinicServiceRepository;

  @override
  Future<Result<String>> call(DeleteClinicServiceParams params) async {
    final result = await _clinicServiceRepository.delete(id: params.id);

    return switch (result) {
      Success(value: final message) => Result.success(message),
      Failed(:final message) => Result.failed(message),
    };
  }
}
