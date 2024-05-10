import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/add_patient_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../misc/clinic_color.dart';
import '../../../../misc/clinic_textstyle.dart';

PreferredSizeWidget patientsAppbar({
  required BuildContext context,
  required User? user,
}) =>
    AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: ClinicColor.white,
      title: Text(
        'Data Pasien',
        style: ClinicTextStyle.h3SemiBold(),
      ),
      centerTitle: true,
      actions: user != null && user.role != 'dokter'
          ? [
              IconButton(
                onPressed: () => context.goNamed(AddPatientScreen.routerName),
                icon: const Icon(
                  CupertinoIcons.add_circled_solid,
                  // size: 30,
                ),
              ),
            ]
          : null,
    );
