import 'package:flutter/material.dart';

import '../../../../misc/clinic_color.dart';
import '../../../../misc/clinic_textstyle.dart';

PreferredSizeWidget addClinicServiceAppbar(BuildContext context) => AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: ClinicColor.white,
      title: Text(
        'Tambah Layanan Baru',
        style: ClinicTextStyle.h3SemiBold(),
      ),
      centerTitle: true,
    );
