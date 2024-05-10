import '../../misc/clinic_color.dart';

class PatientReservationService {
  static statusColor(String status) {
    switch (status) {
      case 'Menunggu':
        return ClinicColor.warning;
      case 'Proses':
        return ClinicColor.primary;
      case 'Selesai':
        return ClinicColor.success;
      case 'Batal':
        return ClinicColor.danger;
      default:
        return ClinicColor.warning;
    }
  }
}
