import 'package:flutter/material.dart';

import '../../../../extension/clinic_dropdown.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

List<Widget> selectMaritalStatus({
  required BuildContext context,
  required List<String> maritalStatuses,
  required String? selectedMaritalStatus,
  required Function(dynamic value) onChanged,
}) =>
    [
      ClinicDropdown(
          hint: selectedMaritalStatus ?? 'Pilih Status Perkawinan',
          items: maritalStatuses
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: ClinicTextStyle.h4Regular(),
                  )))
              .toList(),
          onChanged: onChanged,
          label: 'Status Perkawinan'),
      verticalSpace(14),
    ];
