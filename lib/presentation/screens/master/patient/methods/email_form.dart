import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget emailForm({
  required TextEditingController emailC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: emailC,
            label: 'Email',
            hintText: 'Email Pasien',
          ),
          verticalSpace(14),
        ],
      ),
    );
