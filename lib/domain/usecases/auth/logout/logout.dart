import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

import '../../../../data/repositories/auth/auth_repository.dart';

class Logout implements Usecase<Result<String>, void> {
  final AuthRepository _authRepository;

  Logout({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<Result<String>> call(_) async {
    var result = await _authRepository.logout();

    return switch (result) {
      Success(value: final message) => Result.success(message),
      Failed(:final message) => Result.failed(message),
    };
  }
}
