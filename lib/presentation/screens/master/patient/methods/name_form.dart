import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> nameForm({
  required TextEditingController nameC,
}) =>
    [
      ClinicForm(
        controller: nameC,
        label: 'Nama',
        hintText: 'Nama Pasien',
      ),
      verticalSpace(14),
    ];
