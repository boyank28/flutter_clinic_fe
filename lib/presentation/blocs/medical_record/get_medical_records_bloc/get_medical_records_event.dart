part of 'get_medical_records_bloc.dart';

@freezed
class GetMedicalRecordsEvent with _$GetMedicalRecordsEvent {
  const factory GetMedicalRecordsEvent.getFirst({
    required String record,
  }) = _GetFirst;
  const factory GetMedicalRecordsEvent.getNext({
    required String record,
  }) = _GetNext;
}
