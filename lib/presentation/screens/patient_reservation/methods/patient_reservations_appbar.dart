import 'package:flutter/material.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';

import '../../../misc/clinic_textstyle.dart';

PreferredSizeWidget patientReservationsAppbar() => AppBar(
      backgroundColor: ClinicColor.primary,
      foregroundColor: ClinicColor.white,
      title: Text(
        'Reservasi Pasien',
        style: ClinicTextStyle.h3SemiBold(),
      ),
    );
