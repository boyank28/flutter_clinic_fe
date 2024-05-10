part of 'create_doctor_bloc.dart';

@freezed
class CreateDoctorState with _$CreateDoctorState {
  const factory CreateDoctorState.initial() = _Initial;
  const factory CreateDoctorState.loading() = _Loading;
  const factory CreateDoctorState.success({required Doctor doctor}) = _Success;
  const factory CreateDoctorState.failed({required String message}) = _Failed;
}
