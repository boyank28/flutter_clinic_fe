part of 'update_clinic_service_bloc.dart';

@freezed
class UpdateClinicServiceState with _$UpdateClinicServiceState {
  const factory UpdateClinicServiceState.initial() = _Initial;
  const factory UpdateClinicServiceState.loading() = _Loading;
  const factory UpdateClinicServiceState.success({required ClinicService clinicService}) = _Success;
  const factory UpdateClinicServiceState.failed({required String message}) = _Failed;
}
