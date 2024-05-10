import 'package:flutter/material.dart';

import '../../../../misc/clinic_color.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

List<Widget> notes() => [
      Text(
        'Keterangan :',
        style: ClinicTextStyle.h4Medium(),
      ),
      verticalSpace(7),
      Row(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 20,
                margin: const EdgeInsets.only(right: 7),
                decoration: BoxDecoration(
                  color: ClinicColor.success,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Text(
                'Jadwal Aktif',
                style: ClinicTextStyle.h4Regular(),
              )
            ],
          ),
          horizontalSpaces(24),
          Text(
            '|',
            style: ClinicTextStyle.h4Medium().copyWith(color: ClinicColor.grey),
          ),
          horizontalSpaces(24),
          Row(
            children: [
              Container(
                width: 50,
                height: 20,
                margin: const EdgeInsets.only(right: 7),
                decoration: BoxDecoration(
                  color: ClinicColor.danger,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Text(
                'Jadwal Tidak Aktif',
                style: ClinicTextStyle.h4Regular(),
              )
            ],
          ),
        ],
      ),
      verticalSpace(14),
    ];
