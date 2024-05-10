part of 'logout_bloc.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = _Initial;
  const factory LogoutState.loading() = _Loading;
  const factory LogoutState.success({required String message}) = _Success;
  const factory LogoutState.failed({required String message}) = _Failed;
}
