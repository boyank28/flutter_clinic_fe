import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget rwForm({
  required TextEditingController rwC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: rwC,
            label: 'RW',
            hintText: 'RW',
            keyboardType: TextInputType.number,
          ),
          verticalSpace(14),
        ],
      ),
    );
