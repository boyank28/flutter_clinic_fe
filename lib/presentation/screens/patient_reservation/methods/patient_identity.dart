import 'package:flutter/material.dart';

import '../../../../domain/entities/patient.dart';
import '../../../extension/datetime_formatter.dart';
import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';

List<Widget> patientIdentity({
  required BuildContext context,
  required Patient patient,
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
          'Identitas Pasien',
          style: ClinicTextStyle.h4SemiBold().copyWith(color: ClinicColor.black),
        ),
      ),
      verticalSpace(14),
      Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Pasien',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.name,
                  style: ClinicTextStyle.h4SemiBold(),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jenis Kelamin',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.gender,
                  style: ClinicTextStyle.h4SemiBold(),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tempat Lahir',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.birthPlace,
                  style: ClinicTextStyle.h4SemiBold(),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tanggal Lahir',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  DateTimeFormatter.dMMMMyyy(patient.birthDate.toString()),
                  style: ClinicTextStyle.h4SemiBold(),
                )
              ],
            ),
          ),
        ],
      ),
      verticalSpace(14),
      Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NIK',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.nik,
                  style: ClinicTextStyle.h4SemiBold(),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No Kartu Keluarga',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.noKk,
                  style: ClinicTextStyle.h4SemiBold(),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status Perkawinan',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.maritalStatus,
                  style: ClinicTextStyle.h4SemiBold(),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status Kematian',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.isDeceased == 1 ? 'Meninggal' : 'Hidup',
                  style: ClinicTextStyle.h4SemiBold(),
                )
              ],
            ),
          ),
        ],
      ),
      verticalSpace(24),
    ];
