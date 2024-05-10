import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget phoneForm({
  required TextEditingController phoneC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: phoneC,
            label: 'No Telepon',
            hintText: 'No Telepon Pasien',
            keyboardType: TextInputType.number,
          ),
          verticalSpace(14),
        ],
      ),
    );
