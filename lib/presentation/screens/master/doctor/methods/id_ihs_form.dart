import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

List<Widget> idIhsForm({required TextEditingController idIhsC}) => [
      ClinicForm(
        controller: idIhsC,
        label: 'ID IHS',
        hintText: 'ID IHS',
        keyboardType: TextInputType.number,
      ),
      verticalSpace(14),
    ];
