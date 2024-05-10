import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget rtForm({
  required TextEditingController rtC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: rtC,
            label: 'RT',
            hintText: 'RT',
            keyboardType: TextInputType.number,
          ),
          verticalSpace(14),
        ],
      ),
    );
