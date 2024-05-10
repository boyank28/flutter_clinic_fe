import 'package:flutter/material.dart';

import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';

PreferredSizeWidget addPatientReservationAppbar() => AppBar(
      backgroundColor: ClinicColor.primary,
      foregroundColor: ClinicColor.white,
      title: Text(
        'Buat Reservasi',
        style: ClinicTextStyle.h3SemiBold(),
      ),
    );
