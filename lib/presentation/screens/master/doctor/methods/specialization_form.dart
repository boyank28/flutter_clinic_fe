import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> specializationForm({
  required TextEditingController specializationC,
}) =>
    [
      ClinicForm(controller: specializationC, label: 'Spesialisasi', hintText: 'Spesialisasi Dokter'),
      verticalSpace(14),
    ];
