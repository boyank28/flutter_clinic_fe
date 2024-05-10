import 'package:flutter/material.dart';

import '../../../../extension/clinic_dropdown.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

List<Widget> selectGender({
  required BuildContext context,
  required List<String> genders,
  required String? selectedGender,
  required Function(dynamic value) onChanged,
}) =>
    [
      ClinicDropdown(
          hint: selectedGender ?? 'Pilih Jenis Kelamin',
          items: genders
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: ClinicTextStyle.h4Regular(),
                  )))
              .toList(),
          onChanged: onChanged,
          label: 'Jenis Kelamin'),
      verticalSpace(14),
    ];
