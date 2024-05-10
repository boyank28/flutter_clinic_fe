import 'package:flutter/material.dart';

import '../../../../misc/clinic_color.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

List<Widget> patientsTitle() => [
      Text(
        'Data Pasien',
        style: ClinicTextStyle.h4SemiBold(),
      ),
      Divider(
        color: ClinicColor.border,
      ),
      verticalSpace(14),
    ];
