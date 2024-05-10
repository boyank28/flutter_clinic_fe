part of 'update_clinic_service_bloc.dart';

@freezed
class UpdateClinicServiceEvent with _$UpdateClinicServiceEvent {
  const factory UpdateClinicServiceEvent.updateById({
    required int id,
    required String name,
    required String category,
    required int price,
    required int qty,
  }) = _UpdateById;
}
