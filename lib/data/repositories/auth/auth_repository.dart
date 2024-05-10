import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Result<User>> login({
    required String email,
    required String password,
  });

  Future<Result<User>> getUser();

  Future<Result<String>> logout();
}
