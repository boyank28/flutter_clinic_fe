import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> emailForm({
  required TextEditingController emailC,
}) =>
    [
      ClinicForm(controller: emailC, label: 'Email', hintText: 'Email Dokter'),
      verticalSpace(14),
    ];
