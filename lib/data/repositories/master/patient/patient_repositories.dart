import '../../../../domain/entities/patient.dart';
import '../../../../domain/entities/result.dart';

abstract interface class PatientRepository {
  Future<Result<List<Patient>>> getAll({required String patient, required int page});

  Future<Result<Patient>> create({
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
  });

  Future<Result<Patient>> show({required int id});

  Future<Result<Patient>> update({
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
  });

  Future<Result<String>> delete({required int id});
}
