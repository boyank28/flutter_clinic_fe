// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/entities/result.dart';
import 'package:flutter_clinic/domain/usecases/auth/get_user/get_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/auth/auth_repository.dart';
import 'package:flutter_clinic/domain/entities/user.dart';

part 'get_user_bloc.freezed.dart';
part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final AuthRepository _authRepository;
  GetUserBloc(
    this._authRepository,
  ) : super(const _Initial()) {
    on<_DoGet>((event, emit) async {
      emit(const _Loading());

      GetUser getUser = GetUser(authRepository: _authRepository);

      var result = await getUser(null);

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
