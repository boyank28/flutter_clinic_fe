import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';

import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';

List<Widget> patientAddress({
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
        child: Text('Alamat Pasien', style: ClinicTextStyle.h4SemiBold().copyWith(color: ClinicColor.black)),
      ),
      verticalSpace(14),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat Lengkap',
            style: ClinicTextStyle.h4Regular()
                .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
          ),
          Text(
            patient.addressLine,
            style: ClinicTextStyle.h4SemiBold(),
          )
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
                  'RT/RW',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  '${patient.rt}/${patient.rw}',
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
                  'Kelurahan',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.village,
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
                  'Kecamatan',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.district,
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
                  'Kota',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.city,
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
                  'Provinsi',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.province,
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
                  'Kode Pos',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.postalCode,
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
                  'No Telepon',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.phone,
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
                  'Email',
                  style: ClinicTextStyle.h4Regular()
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
                ),
                Text(
                  patient.email ?? '-',
                  style: ClinicTextStyle.h4SemiBold(),
                )
              ],
            ),
          ),
        ],
      ),
      verticalSpace(24),
    ];
