import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget postalCodeForm({
  required TextEditingController postalCodeC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: postalCodeC,
            label: 'Kode Pos',
            hintText: 'Kode Pos',
            keyboardType: TextInputType.number,
          ),
          verticalSpace(14),
        ],
      ),
    );
