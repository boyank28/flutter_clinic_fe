part of 'create_clinic_service_bloc.dart';

@freezed
class CreateClinicServiceState with _$CreateClinicServiceState {
  const factory CreateClinicServiceState.initial() = _Initial;
  const factory CreateClinicServiceState.loading() = _Loading;
  const factory CreateClinicServiceState.success({required ClinicService clinicService}) = _Success;
  const factory CreateClinicServiceState.failed({required String message}) = _Failed;
}
