import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> sipForm({
  required TextEditingController sipC,
}) =>
    [
      ClinicForm(
        controller: sipC,
        label: 'SIP',
        hintText: 'Nomor SIP',
        keyboardType: TextInputType.number,
      ),
      verticalSpace(14),
    ];
