import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> priceForm({
  required TextEditingController priceC,
}) =>
    [
      ClinicForm(
        controller: priceC,
        keyboardType: TextInputType.number,
        label: 'Harga (Rupiah)',
        hintText: 'Harga (Rupiah)',
      ),
      verticalSpace(14),
    ];
