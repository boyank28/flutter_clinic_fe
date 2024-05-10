// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_clinic/domain/usecases/satu_sehat/ss_get_token/ss_get_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic/data/repositories/satu_sehat/satu_sehat_repository.dart';

import '../../../../domain/entities/result.dart';

part 'ss_get_token_bloc.freezed.dart';
part 'ss_get_token_event.dart';
part 'ss_get_token_state.dart';

class SsGetTokenBloc extends Bloc<SsGetTokenEvent, SsGetTokenState> {
  final SatuSehatRepository _satuSehatRepository;
  SsGetTokenBloc(
    this._satuSehatRepository,
  ) : super(const _Initial()) {
    on<_DoGet>((event, emit) async {
      emit(const _Loading());

      SSGetToken ssGetToken = SSGetToken(
        satuSehatRepository: _satuSehatRepository,
      );

      final result = await ssGetToken(null);

      switch (result) {
        case Success(value: final token):
          emit(_Success(token: token));
          break;
        case Failed(message: final message):
          emit(_Failed(message: message));
          break;
      }
    });
  }
}
