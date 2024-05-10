import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget relationshipPhoneForm({
  required TextEditingController relationshipPhoneC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: relationshipPhoneC,
            label: 'No Telepon',
            hintText: 'No Telepon Pasangan',
            keyboardType: TextInputType.number,
          ),
          verticalSpace(14),
        ],
      ),
    );
