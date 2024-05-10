part of 'create_clinic_service_bloc.dart';

@freezed
class CreateClinicServiceEvent with _$CreateClinicServiceEvent {
  const factory CreateClinicServiceEvent.doCreate({
    required String name,
    required String category,
    required int price,
    required int qty,
  }) = _DoCreate;
}
