part of 'get_user_bloc.dart';

@freezed
class GetUserState with _$GetUserState {
  const factory GetUserState.initial() = _Initial;
  const factory GetUserState.loading() = _Loading;
  const factory GetUserState.success({required User user}) = _Success;
  const factory GetUserState.failed({required String message}) = _Failed;
}
