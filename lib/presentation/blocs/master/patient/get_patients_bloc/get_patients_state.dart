part of 'get_patients_bloc.dart';

@freezed
class GetPatientsState with _$GetPatientsState {
  const factory GetPatientsState.initial() = _Initial;
  const factory GetPatientsState.loading() = _Loading;
  const factory GetPatientsState.success({required List<Patient> patients, required bool isNext}) = _Success;
  const factory GetPatientsState.failed({required String message}) = _Failed;
}
