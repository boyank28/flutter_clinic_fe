part of 'show_patient_bloc.dart';

@freezed
class ShowPatientState with _$ShowPatientState {
  const factory ShowPatientState.initial() = _Initial;
  const factory ShowPatientState.loading() = _Loading;
  const factory ShowPatientState.success({required Patient patient}) = _Success;
  const factory ShowPatientState.failed({required String message}) = _Failed;
}
