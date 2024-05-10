import 'package:flutter/material.dart';

import '../../../../misc/clinic_color.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

List<Widget> doctorsTitle() => [
      Text(
        'Data Dokter',
        style: ClinicTextStyle.h4SemiBold(),
      ),
      Divider(
        color: ClinicColor.border,
      ),
      verticalSpace(14),
    ];
