import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/clinic_service.dart';
import 'package:flutter_clinic/domain/entities/user.dart';

import '../../../../extension/rupiah_formatter.dart';
import '../../../../misc/clinic_color.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../misc/spacing.dart';

Future<dynamic> detailClinicServiceDialog({
  required BuildContext context,
  required ClinicService service,
  required User? user,
  required VoidCallback onTapEdit,
  required VoidCallback onTapDelete,
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog.adaptive(
      title: Text(
        'Detail Layanan',
        style: ClinicTextStyle.h3SemiBold(),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama Layanan :',
            style: ClinicTextStyle.h4Regular().copyWith(
              color: ClinicColor.grey,
            ),
          ),
          Text(
            service.name,
            style: ClinicTextStyle.h4Medium(),
          ),
          verticalSpace(7),
          Text(
            'Kategori Layanan :',
            style: ClinicTextStyle.h4Regular().copyWith(
              color: ClinicColor.grey,
            ),
          ),
          Text(
            service.category,
            style: ClinicTextStyle.h4Medium(),
          ),
          verticalSpace(7),
          Text(
            'Harga Layanan :',
            style: ClinicTextStyle.h4Regular().copyWith(
              color: ClinicColor.grey,
            ),
          ),
          Text(
            rupiahFormatter(service.price.toString()),
            style: ClinicTextStyle.h4Medium(),
          ),
          verticalSpace(7),
          Text(
            'Qty :',
            style: ClinicTextStyle.h4Regular().copyWith(
              color: ClinicColor.grey,
            ),
          ),
          Text(
            service.qty.toString(),
            style: ClinicTextStyle.h4Medium(),
          ),
          verticalSpace(7),
        ],
      ),
      actions: user != null && user.role == 'admin'
          ? [
              TextButton(
                onPressed: onTapDelete,
                child: Text(
                  'Hapus',
                  style: ClinicTextStyle.h5SemiBold().copyWith(color: ClinicColor.danger),
                ),
              ),
              TextButton(
                onPressed: onTapEdit,
                child: const Text('Edit'),
              ),
            ]
          : null,
    ),
  );
}
