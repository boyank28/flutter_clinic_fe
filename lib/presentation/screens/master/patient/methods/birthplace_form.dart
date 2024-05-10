import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget birthPlaceForm({
  required TextEditingController birthPlaceC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: birthPlaceC,
            label: 'Tempat Lahir',
            hintText: 'Tempat Lahir Pasien',
            keyboardType: TextInputType.number,
          ),
          verticalSpace(14),
        ],
      ),
    );
