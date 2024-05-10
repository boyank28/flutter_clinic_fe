import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget nikForm({
  required TextEditingController nikC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: nikC,
            label: 'NIK',
            hintText: 'NIK Pasien',
            keyboardType: TextInputType.number,
          ),
          verticalSpace(14),
        ],
      ),
    );
