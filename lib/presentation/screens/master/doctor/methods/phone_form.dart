import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> phoneForm({
  required TextEditingController phoneC,
}) =>
    [
      ClinicForm(
        controller: phoneC,
        label: 'No Telepon',
        hintText: 'No Telepon Dokter',
        keyboardType: TextInputType.phone,
      ),
      verticalSpace(14),
    ];
