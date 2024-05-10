part of 'ss_get_token_bloc.dart';

@freezed
class SsGetTokenState with _$SsGetTokenState {
  const factory SsGetTokenState.initial() = _Initial;
  const factory SsGetTokenState.loading() = _Loading;
  const factory SsGetTokenState.success({required String token}) = _Success;
  const factory SsGetTokenState.failed({required String message}) = _Failed;
}
