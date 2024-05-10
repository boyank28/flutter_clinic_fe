import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/domain/entities/user.dart';

import '../../../extension/clinic_form.dart';
import '../../../misc/spacing.dart';

List<Widget> doctorNotesForm({
  required PatientReservation patientReservation,
  required TextEditingController doctorNotesC,
  required User? user,
}) =>
    [
      ClinicForm(
        controller: doctorNotesC,
        readOnly: patientReservation.status == 'Batal' ? true : user != null && user.role == 'user',
        label: 'Catatan',
        hintText: 'Catatan dokter untuk pasien',
        minLines: 3,
        maxLines: 5,
      ),
      verticalSpace(14),
    ];
