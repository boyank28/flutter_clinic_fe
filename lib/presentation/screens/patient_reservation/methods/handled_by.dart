import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/doctor.dart';
import 'package:flutter_clinic/presentation/widgets/selected_doctor_card.dart';

import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';

List<Widget> handledBy({
  required BuildContext context,
  required Doctor? selectedDoctor,
  required TextEditingController doctorSearchC,
  required ScrollController scrollC,
  required VoidCallback onPressed,
}) =>
    [
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ClinicColor.border,
        ),
        child: Text('Ditangani Oleh', style: ClinicTextStyle.h4SemiBold().copyWith(color: ClinicColor.black)),
      ),
      verticalSpace(14),
      if (selectedDoctor == null)
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Belum memilih dokter',
              style: ClinicTextStyle.h4Regular(),
            ),
            horizontalSpaces(24),
            SizedBox(
              width: 160,
              height: 40,
              child: TextButton(
                onPressed: onPressed,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pilih Dokter',
                      style: ClinicTextStyle.h5SemiBold().copyWith(color: ClinicColor.primary),
                    ),
                    horizontalSpaces(7),
                    Icon(
                      CupertinoIcons.arrow_down_square_fill,
                      size: 20,
                      color: ClinicColor.primary,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      if (selectedDoctor != null)
        SelectedDoctorCard(
          selectedDoctor: selectedDoctor,
          onPressed: onPressed,
        ),
      verticalSpace(14),
    ];
