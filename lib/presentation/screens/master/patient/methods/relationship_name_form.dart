import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget relationshipNameForm({
  required TextEditingController relationshipNameC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: relationshipNameC,
            label: 'Nama Pasangan',
            hintText: 'Nama Pasangan',
          ),
          verticalSpace(14),
        ],
      ),
    );
