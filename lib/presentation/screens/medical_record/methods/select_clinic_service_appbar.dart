import 'package:flutter/material.dart';

import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';

PreferredSizeWidget selectClinicServiceAppbar() => AppBar(
      backgroundColor: ClinicColor.primary,
      foregroundColor: ClinicColor.white,
      title: Text(
        'Pilih Layanan',
        style: ClinicTextStyle.h3SemiBold(),
      ),
      centerTitle: true,
    );
