// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/auth/login/login.dart';
import 'package:flutter_clinic/domain/usecases/auth/login/login_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/auth/auth_repository.dart';
import 'package:flutter_clinic/domain/entities/user.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  LoginBloc(
    this._authRepository,
  ) : super(const _Initial()) {
    on<_DoLogin>((event, emit) async {
      emit(const _Loading());

      Login login = Login(authRepository: _authRepository);

      var result = await login(
        LoginParams(
          email: event.email,
          password: event.password,
        ),
      );

      switch (result) {
        case Success(value: final user):
          emit(_Success(user: user));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
