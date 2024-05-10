import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget noKKForm({
  required TextEditingController noKKC,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: noKKC,
            label: 'Nomor Kartu Keluarga',
            hintText: 'Nomor Kartu Keluarga',
            keyboardType: TextInputType.number,
          ),
          verticalSpace(14),
        ],
      ),
    );
