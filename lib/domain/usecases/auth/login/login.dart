import 'package:flutter_clinic/data/repositories/auth/auth_repository.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/domain/usecases/auth/login/login_params.dart';
import 'package:flutter_clinic/domain/usecases/usecase.dart';

class Login implements Usecase<Result<User>, LoginParams> {
  final AuthRepository _authRepository;

  Login({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<Result<User>> call(LoginParams params) async {
    var result = await _authRepository.login(
      email: params.email,
      password: params.password,
    );

    return switch (result) {
      Success(value: final user) => Result.success(user),
      Failed(:final message) => Result.failed(message),
    };
  }
}
