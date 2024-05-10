import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';

import '../../../../blocs/satu_sehat/ss_get_districts_bloc/ss_get_districts_bloc.dart';
import '../../../../extension/clinic_dropdown.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

Widget selectDistrict({
  required Region? selectedDistrict,
  required Function(dynamic value) onChanged,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          BlocBuilder<SsGetDistrictsBloc, SsGetDistrictsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => ClinicDropdown(
                  hint: selectedDistrict?.name ?? 'Belum memilih kota',
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Kecamatan',
                ),
                loading: () => ClinicDropdown(
                  hint: selectedDistrict?.name ?? 'Pilih Kecamatan',
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Kecamatan',
                  isLoading: true,
                ),
                failed: (message) => ClinicDropdown(
                  hint: message,
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Kecamatan',
                  isLoading: true,
                ),
                success: (districts) => ClinicDropdown(
                  hint: selectedDistrict?.name ?? 'Pilih Kecamatan',
                  items: districts
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
                  label: 'Pilih Kecamatan',
                ),
              );
            },
          ),
          verticalSpace(14),
        ],
      ),
    );
