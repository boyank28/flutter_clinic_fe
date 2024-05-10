import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';

import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';

List<Widget> doctorNotes({
  required BuildContext context,
  required MedicalRecord medicalRecord,
}) =>
    [
      Text(
        'Catatan Dokter',
        style: ClinicTextStyle.h4Regular().copyWith(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
        ),
      ),
      Text(
        medicalRecord.doctorNotes,
        style: ClinicTextStyle.h4Regular(),
      ),
      verticalSpace(14),
    ];
