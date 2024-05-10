import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> serviceNameForm({
  required TextEditingController nameC,
}) =>
    [
      ClinicForm(
        controller: nameC,
        label: 'Nama Layanan',
        hintText: 'Nama Layanan',
      ),
      verticalSpace(14),
    ];
