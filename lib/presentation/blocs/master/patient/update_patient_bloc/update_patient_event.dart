part of 'update_patient_bloc.dart';

@freezed
class UpdatePatientEvent with _$UpdatePatientEvent {
  const factory UpdatePatientEvent.updateById({
    required int id,
    required String nik,
    required String noKk,
    required String name,
    required String phone,
    required String? email,
    required String gender,
    required String birthPlace,
    required DateTime birthDate,
    required String addressLine,
    required String city,
    required String cityCode,
    required String province,
    required String provinceCode,
    required String district,
    required String districtCode,
    required String village,
    required String villageCode,
    required String rt,
    required String rw,
    required String postalCode,
    required String maritalStatus,
    required String? relationshipName,
    required String? relationshipPhone,
    required int isDeceased,
  }) = _UpdateById;
}
