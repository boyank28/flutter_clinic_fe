import 'package:flutter/material.dart';

import '../../../../extension/clinic_dropdown.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

List<Widget> selectIsDeceased({
  required BuildContext context,
  required List<String> isDeceased,
  required String? selectedIsDeceased,
  required Function(dynamic value) onChanged,
}) =>
    [
      ClinicDropdown(
          hint: selectedIsDeceased ?? 'Pilih Status Kematian',
          items: isDeceased
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: ClinicTextStyle.h4Regular(),
                  )))
              .toList(),
          onChanged: onChanged,
          label: 'Status Kematian'),
      verticalSpace(14),
    ];
