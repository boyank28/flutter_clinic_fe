import 'package:flutter/material.dart';

import '../../../../misc/clinic_color.dart';
import '../../../../misc/clinic_textstyle.dart';

PreferredSizeWidget editDoctorAppbar(BuildContext context) => AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: ClinicColor.white,
      title: Text(
        'Ubah Dokter',
        style: ClinicTextStyle.h3SemiBold(),
      ),
      centerTitle: true,
    );
