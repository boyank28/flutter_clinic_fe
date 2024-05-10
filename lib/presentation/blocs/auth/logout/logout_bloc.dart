// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/usecases/auth/logout/logout.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/auth/auth_repository.dart';

import '../../../../domain/entities/result.dart';

part 'logout_bloc.freezed.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRepository _authRepository;
  LogoutBloc(
    this._authRepository,
  ) : super(const _Initial()) {
    on<_DoLogout>((event, emit) async {
      emit(const _Loading());

      Logout logout = Logout(authRepository: _authRepository);

      var result = await logout(null);

      switch (result) {
        case Success(value: final message):
          emit(_Success(message: message));
          break;
        case Failed(:final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
