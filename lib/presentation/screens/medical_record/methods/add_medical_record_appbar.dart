import 'package:flutter/material.dart';

import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';

PreferredSizeWidget addMedicalRecordAppbar(BuildContext context) => AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: ClinicColor.white,
      title: Text(
        'Buat Medical Record',
        style: ClinicTextStyle.h3SemiBold(),
      ),
      centerTitle: true,
    );
