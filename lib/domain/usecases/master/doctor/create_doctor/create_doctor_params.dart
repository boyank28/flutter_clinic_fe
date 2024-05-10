class CreateDoctorParams {
  final String name;
  final String? nik;
  final String sip;
  final String? idIhs;
  final String specialization;
  final String? address;
  final String email;
  final String phone;
  final String? photo;

  CreateDoctorParams(
      {required this.name,
      required this.nik,
      required this.sip,
      required this.idIhs,
      required this.specialization,
      required this.address,
      required this.email,
      required this.phone,
      required this.photo});
}
