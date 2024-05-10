part of 'create_doctor_bloc.dart';

@freezed
class CreateDoctorEvent with _$CreateDoctorEvent {
  const factory CreateDoctorEvent.doCreate({
    required String name,
    required String? nik,
    required String sip,
    required String? idIhs,
    required String specialization,
    required String? address,
    required String email,
    required String phone,
    required String? photo,
  }) = _DoCreate;
}
