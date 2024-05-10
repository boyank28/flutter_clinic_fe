part of 'get_medical_records_bloc.dart';

@freezed
class GetMedicalRecordsState with _$GetMedicalRecordsState {
  const factory GetMedicalRecordsState.initial() = _Initial;
  const factory GetMedicalRecordsState.loading() = _Loading;
  const factory GetMedicalRecordsState.success({
    required List<MedicalRecord> medicalRecords,
    required bool isNext,
  }) = _Success;
  const factory GetMedicalRecordsState.failed({required String message}) = _Failed;
}
