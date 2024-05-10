part of 'get_clinic_services_bloc.dart';

@freezed
class GetClinicServicesEvent with _$GetClinicServicesEvent {
  const factory GetClinicServicesEvent.getAll({required String name}) = _GetAll;

  const factory GetClinicServicesEvent.clearChecked() = _ClearChecked;

  const factory GetClinicServicesEvent.checkedToggle({
    required int index,
    required bool value,
  }) = _CheckedToggle;

  const factory GetClinicServicesEvent.increaseQty({
    required int id,
  }) = _IncreaseQty;

  const factory GetClinicServicesEvent.decreaseQty({
    required int id,
  }) = _DecreaseQty;
}
