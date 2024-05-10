import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';

import '../../../extension/clinic_form.dart';
import '../../../extension/datetime_formatter.dart';
import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';

List<Widget> reservationAddressAndComplaint({
  required BuildContext context,
  required Patient patient,
  required TextEditingController complaintC,
}) =>
    [
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ClinicColor.border,
        ),
        child: Text(
          'Tanggal Reservasi & Keluhan',
          style: ClinicTextStyle.h4SemiBold().copyWith(color: ClinicColor.black),
        ),
      ),
      verticalSpace(14),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tanggal Reservasi',
            style: ClinicTextStyle.h4Regular()
                .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
          ),
          Text(
            DateTimeFormatter.dMMMMyyy(DateTime.now().toString()),
            style: ClinicTextStyle.h4SemiBold(),
          ),
          verticalSpace(14),
          ClinicForm(
            controller: complaintC,
            label: 'Keluhan',
            hintText: 'Isi keluhan pasien',
            minLines: 3,
            maxLines: 5,
          ),
        ],
      ),
      verticalSpace(24),
    ];
