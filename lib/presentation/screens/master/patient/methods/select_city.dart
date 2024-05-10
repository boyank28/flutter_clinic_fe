import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';

import '../../../../blocs/satu_sehat/ss_get_cities_bloc/ss_get_cities_bloc.dart';
import '../../../../extension/clinic_dropdown.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

Widget selectCity({
  required Region? selectedCity,
  required Function(dynamic value) onChanged,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          BlocBuilder<SsGetCitiesBloc, SsGetCitiesState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => ClinicDropdown(
                  hint: selectedCity?.name ?? 'Belum memilih provinsi',
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Kota',
                ),
                loading: () => ClinicDropdown(
                  isLoading: true,
                  hint: selectedCity?.name ?? 'Pilih Kota',
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Kota',
                ),
                failed: (message) => ClinicDropdown(
                  hint: message,
                  items: const [],
                  onChanged: onChanged,
                  label: 'Pilih Kota',
                ),
                success: (cities) => ClinicDropdown(
                  hint: selectedCity?.name ?? 'Pilih Kota',
                  items: cities
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
                  label: 'Pilih Kota',
                ),
              );
            },
          ),
          verticalSpace(14),
        ],
      ),
    );
