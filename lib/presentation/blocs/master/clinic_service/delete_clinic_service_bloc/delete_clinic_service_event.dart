part of 'delete_clinic_service_bloc.dart';

@freezed
class DeleteClinicServiceEvent with _$DeleteClinicServiceEvent {
  const factory DeleteClinicServiceEvent.deleteById({required int id}) = _DeleteById;
}
