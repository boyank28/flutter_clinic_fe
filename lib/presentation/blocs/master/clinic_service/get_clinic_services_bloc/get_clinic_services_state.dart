part of 'get_clinic_services_bloc.dart';

@freezed
class GetClinicServicesState with _$GetClinicServicesState {
  const factory GetClinicServicesState.initial() = _Initial;
  const factory GetClinicServicesState.loading({required List<ClinicService> clinicServices}) = _Loading;
  const factory GetClinicServicesState.success({required List<ClinicService> clinicServices}) = _Success;
  const factory GetClinicServicesState.failed({required String message}) = _Failed;
}
