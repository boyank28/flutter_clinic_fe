part of 'create_patient_bloc.dart';

@freezed
class CreatePatientState with _$CreatePatientState {
  const factory CreatePatientState.initial() = _Initial;
  const factory CreatePatientState.loading() = _Loading;
  const factory CreatePatientState.success({required Patient patient}) = _Success;
  const factory CreatePatientState.failed({required String message}) = _Failed;
}
