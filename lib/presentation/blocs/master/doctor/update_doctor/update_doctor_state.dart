part of 'update_doctor_bloc.dart';

@freezed
class UpdateDoctorState with _$UpdateDoctorState {
  const factory UpdateDoctorState.initial() = _Initial;
  const factory UpdateDoctorState.loading() = _Loading;
  const factory UpdateDoctorState.success({required Doctor doctor}) = _Success;
  const factory UpdateDoctorState.failed({required String message}) = _Failed;
}
