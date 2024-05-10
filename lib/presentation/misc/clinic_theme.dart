import 'package:flutter/material.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';
import 'package:flutter_clinic/presentation/misc/clinic_textstyle.dart';

class ClinicTheme {
  static lightTheme() => ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          background: ClinicColor.lightBg,
          primary: ClinicColor.primary,
          onBackground: ClinicColor.black,
        ),
        hintColor: ClinicColor.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ClinicColor.primary,
            foregroundColor: ClinicColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(double.infinity, 45),
            textStyle: ClinicTextStyle.h4SemiBold(),
          ),
        ),
      );

  static darkTheme() => ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          background: ClinicColor.darkBg,
          primary: ClinicColor.primary,
          onBackground: ClinicColor.white,
        ),
        hintColor: ClinicColor.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ClinicColor.primary,
            foregroundColor: ClinicColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(double.infinity, 45),
            textStyle: ClinicTextStyle.h4SemiBold(),
          ),
        ),
      );
}
