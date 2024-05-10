import 'package:flutter/material.dart';

import '../../../../extension/clinic_dropdown.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

List<Widget> serviceCategoryDropdown({
  required String? selectedCategory,
  required void Function(dynamic value) onChanged,
}) =>
    [
      ClinicDropdown(
          hint: selectedCategory ?? 'Pilih Kategori',
          items: ['Pilih Kategori', 'Obat-Obatan', 'Treatment', 'Konsultasi']
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: ClinicTextStyle.h4Medium(),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          label: 'Kategori Layanan'),
      verticalSpace(14),
    ];
