part of 'update_doctor_bloc.dart';

@freezed
class UpdateDoctorEvent with _$UpdateDoctorEvent {
  const factory UpdateDoctorEvent.doUpdate({
    required int id,
    required String? name,
    required String? nik,
    required String? sip,
    required String? idIhs,
    required String? specialization,
    required String? address,
    required String? email,
    required String? phone,
    required String? photo,
  }) = _DoUpdate;
}
