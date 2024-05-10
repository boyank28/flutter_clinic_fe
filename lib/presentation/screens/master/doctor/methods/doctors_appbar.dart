import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/add_doctor_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../misc/clinic_color.dart';
import '../../../../misc/clinic_textstyle.dart';

PreferredSizeWidget doctorsAppbar({
  required BuildContext context,
  required User? user,
}) =>
    AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: ClinicColor.white,
      title: Text(
        'Data Dokter',
        style: ClinicTextStyle.h3SemiBold(),
      ),
      centerTitle: true,
      actions: [
        if (user != null && user.role == 'admin')
          IconButton(
            onPressed: () => context.goNamed(AddDoctorScreen.routerName),
            icon: const Icon(
              CupertinoIcons.add_circled_solid,
              // size: 30,
            ),
          ),
      ],
    );
