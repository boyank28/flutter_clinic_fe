part of 'create_medical_record_bloc.dart';

@freezed
class CreateMedicalRecordState with _$CreateMedicalRecordState {
  const factory CreateMedicalRecordState.initial() = _Initial;
  const factory CreateMedicalRecordState.loading() = _Loading;
  const factory CreateMedicalRecordState.success({required MedicalRecord medicalRecord}) = _Success;
  const factory CreateMedicalRecordState.failed({required String message}) = _Failed;
}
