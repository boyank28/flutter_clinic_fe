import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';
import 'package:flutter_clinic/presentation/misc/clinic_textstyle.dart';

class ClinicAlert {
  static successful({required BuildContext context, required String content}) {
    return context.showFlash(
      barrierDismissible: true,
      duration: const Duration(seconds: 3),
      builder: (context, controller) => FlashBar(
        controller: controller,
        elevation: 1,
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.bounceIn,
        position: FlashPosition.top,
        indicatorColor: ClinicColor.success,
        backgroundColor: ClinicColor.success,
        icon: Icon(Icons.error_rounded, color: ClinicColor.white),
        title: Text(
          'Sukses!',
          style: ClinicTextStyle.h4SemiBold().copyWith(color: ClinicColor.white),
        ),
        content: Text(
          content,
          style: ClinicTextStyle.h4Medium().copyWith(color: ClinicColor.white),
        ),
      ),
    );
  }

  static notice({required BuildContext context, required String content}) {
    return context.showFlash(
      barrierDismissible: true,
      duration: const Duration(seconds: 3),
      builder: (context, controller) => FlashBar(
        controller: controller,
        elevation: 1,
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.bounceIn,
        position: FlashPosition.top,
        indicatorColor: ClinicColor.warning,
        backgroundColor: ClinicColor.warning,
        icon: Icon(Icons.error_rounded, color: ClinicColor.black),
        title: Text(
          'Peringatan!',
          style: ClinicTextStyle.h4SemiBold().copyWith(color: ClinicColor.black),
        ),
        content: Text(
          content,
          style: ClinicTextStyle.h4Medium().copyWith(color: ClinicColor.black),
        ),
      ),
    );
  }

  static error({required BuildContext context, required String content}) {
    return context.showFlash(
      barrierDismissible: true,
      duration: const Duration(seconds: 3),
      builder: (context, controller) => FlashBar(
        controller: controller,
        elevation: 1,
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.bounceIn,
        position: FlashPosition.top,
        indicatorColor: ClinicColor.danger,
        backgroundColor: ClinicColor.danger,
        icon: Icon(Icons.error_rounded, color: ClinicColor.white),
        title: Text(
          'Terjadi Kesalahan!',
          style: ClinicTextStyle.h4SemiBold().copyWith(color: ClinicColor.white),
        ),
        content: Text(
          content,
          style: ClinicTextStyle.h4Medium().copyWith(color: ClinicColor.white),
        ),
      ),
    );
  }
}
