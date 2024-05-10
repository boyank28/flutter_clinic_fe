part of 'update_patient_bloc.dart';

@freezed
class UpdatePatientState with _$UpdatePatientState {
  const factory UpdatePatientState.initial() = _Initial;
  const factory UpdatePatientState.loading() = _Loading;
  const factory UpdatePatientState.success({required Patient patient}) = _Success;
  const factory UpdatePatientState.failed({required String message}) = _Failed;
}
