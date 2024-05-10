import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> addressForm({
  required TextEditingController addressC,
}) =>
    [
      ClinicForm(
        controller: addressC,
        label: 'Alamat',
        hintText: 'Alamat Dokter',
        minLines: 3,
        maxLines: 5,
      ),
      verticalSpace(14),
    ];
