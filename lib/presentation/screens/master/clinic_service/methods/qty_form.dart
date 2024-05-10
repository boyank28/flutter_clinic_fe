import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> qtyForm({
  required TextEditingController qtyC,
}) =>
    [
      ClinicForm(
        controller: qtyC,
        keyboardType: TextInputType.number,
        label: 'Qty',
        hintText: 'Qty',
      ),
      verticalSpace(14),
    ];
