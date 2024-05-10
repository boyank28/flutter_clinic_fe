part of 'qris_qr_generate_bloc.dart';

@freezed
class QrisQrGenerateState with _$QrisQrGenerateState {
  const factory QrisQrGenerateState.initial() = _Initial;
  const factory QrisQrGenerateState.loading() = _Loading;
  const factory QrisQrGenerateState.success({required QrisGenerate generateResult}) = _Success;
  const factory QrisQrGenerateState.failed({required String message}) = _Failed;
}
