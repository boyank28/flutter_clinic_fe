import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';

import '../../../../blocs/satu_sehat/ss_get_sub_districts_bloc/ss_get_sub_districts_bloc.dart';
import '../../../../extension/clinic_dropdown.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

Widget selecSubDistrict({
  required Region? selectedSubdistrict,
  required Function(dynamic value) onChanged,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          BlocBuilder<SsGetSubDistrictsBloc, SsGetSubDistrictsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => ClinicDropdown(
                  hint: selectedSubdistrict?.name ?? 'Belum memilih kecamatan',
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Kelurahan',
                ),
                loading: () => ClinicDropdown(
                  hint: 'Pilih Kelurahan',
                  isLoading: true,
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Kelurahan',
                ),
                failed: (message) => ClinicDropdown(
                  hint: message,
                  isLoading: true,
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Kelurahan',
                ),
                success: (subDistricts) => ClinicDropdown(
                  hint: selectedSubdistrict?.name ?? 'Pilih Kelurahan',
                  items: subDistricts
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
                  label: 'Pilih Kelurahan',
                ),
              );
            },
          ),
          verticalSpace(14),
        ],
      ),
    );
