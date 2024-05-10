import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> addressLineForm({
  required TextEditingController addressLineC,
}) =>
    [
      ClinicForm(
        controller: addressLineC,
        label: 'Alamat Lengkap',
        hintText: 'Alamat Lengkap Pasien',
        minLines: 3,
        maxLines: 5,
      ),
      verticalSpace(14),
    ];
