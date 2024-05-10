import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> nikForm({
  required TextEditingController nikC,
}) =>
    [
      ClinicForm(
        controller: nikC,
        label: 'NIK',
        hintText: 'NIK',
        keyboardType: TextInputType.number,
      ),
      verticalSpace(14),
    ];
