import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';

import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';
import '../../../widgets/bank_card.dart';

Future<dynamic> selectPaymentMethodModal({
  required BuildContext context,
  required int grossAmount,
  required MedicalRecord medicalRecord,
  required VoidCallback onTapQRIS,
  required VoidCallback onTapTunai,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pilih Metode Pembayaran',
              style: ClinicTextStyle.h4SemiBold(),
            ),
            verticalSpace(24),
            BankCard(
              imagePath: 'assets/images/img_bca.png',
              label: 'Bank BCA (8810299188)',
              onTap: () {},
            ),
            verticalSpace(14),
            BankCard(
              imagePath: 'assets/images/img_mandiri.png',
              label: 'Bank Mandiri (110211928331)',
              onTap: () {},
            ),
            verticalSpace(14),
            BankCard(
              imagePath: 'assets/images/img_qris.png',
              label: 'QRIS',
              onTap: onTapQRIS,
            ),
            verticalSpace(14),
            BankCard(
              label: 'Uang Tunai',
              hasLogo: false,
              onTap: onTapTunai,
            ),
            verticalSpace(40),
          ],
        ),
      );
    },
  );
}
