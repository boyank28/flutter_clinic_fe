part of 'qris_qr_generate_bloc.dart';

@freezed
class QrisQrGenerateEvent with _$QrisQrGenerateEvent {
  const factory QrisQrGenerateEvent.getQrCode({
    required int grossAmount,
  }) = _GetQrCode;
}
