part of 'delete_patient_bloc.dart';

@freezed
class DeletePatientState with _$DeletePatientState {
  const factory DeletePatientState.initial() = _Initial;
  const factory DeletePatientState.loading() = _Loading;
  const factory DeletePatientState.success({required String message}) = _Success;
  const factory DeletePatientState.failed({required String message}) = _Failed;
}
