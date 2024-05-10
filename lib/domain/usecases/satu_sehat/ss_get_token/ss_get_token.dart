import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

import '../../../../data/repositories/satu_sehat/satu_sehat_repository.dart';

class SSGetToken implements Usecase<Result<String>, void> {
  final SatuSehatRepository _satuSehatRepository;

  SSGetToken({required SatuSehatRepository satuSehatRepository}) : _satuSehatRepository = satuSehatRepository;

  @override
  Future<Result<String>> call(_) async {
    final result = await _satuSehatRepository.getToken();

    return switch (result) {
      Success(value: final token) => Result.success(token),
      Failed(:final message) => Result.failed(message),
    };
  }
}
