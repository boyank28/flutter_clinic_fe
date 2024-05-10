import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';

import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';

Widget reservationCanceled({
  required PatientReservation patientReservation,
}) {
  if (patientReservation.status == 'Batal') {
    return Center(
      child: Text(
        'Reservasi ini sudah dibatalkan',
        style: ClinicTextStyle.h4Medium().copyWith(color: ClinicColor.danger),
      ),
    );
  }
  return const SizedBox();
}
