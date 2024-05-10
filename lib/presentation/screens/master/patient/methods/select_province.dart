import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';

import '../../../../blocs/satu_sehat/ss_get_provinces_bloc/ss_get_provinces_bloc.dart';
import '../../../../extension/clinic_dropdown.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

Widget selectProvince({
  required Region? selectedProvince,
  required Function(dynamic value) onChanged,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          BlocBuilder<SsGetProvincesBloc, SsGetProvincesState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => ClinicDropdown(
                  isLoading: true,
                  hint: selectedProvince?.name ?? 'Pilih Provinsi',
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Provinsi',
                ),
                failed: (message) => ClinicDropdown(
                  hint: message,
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Provinsi',
                ),
                success: (provinces) => ClinicDropdown(
                  hint: selectedProvince?.name ?? 'Pilih Provinsi',
                  items: provinces
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name,
                            style: ClinicTextStyle.h4Regular(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: onChanged,
                  label: 'Pilih Provinsi',
                ),
              );
            },
          ),
          verticalSpace(14),
        ],
      ),
    );
