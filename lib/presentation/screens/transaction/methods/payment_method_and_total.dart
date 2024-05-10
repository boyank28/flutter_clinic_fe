import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';

import '../../../extension/rupiah_formatter.dart';
import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';
import '../../medical_record/methods/select_payment_method_modal.dart';

Widget paymentMethodAndTotal({
  required BuildContext context,
  required MedicalRecord medicalRecord,
  required VoidCallback onTapQRIS,
  required VoidCallback onTapTunai,
  required String paymentMethod,
}) =>
    Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: ClinicColor.white,
          borderRadius: BorderRadius.circular(12),
          border: paymentMethod == 'Tunai' ? Border.all(color: ClinicColor.border) : null),
      child: Column(
        children: [
          Row(
            children: [
              if (paymentMethod == 'QRIS')
                const FadeInImage(
                  alignment: Alignment.centerLeft,
                  placeholder: AssetImage('assets/images/img_placeholder.png'),
                  image: AssetImage('assets/images/img_qris.png'),
                  fit: BoxFit.fitHeight,
                  height: 20,
                  fadeInDuration: Duration(milliseconds: 300),
                  fadeOutDuration: Duration(milliseconds: 300),
                ),
              if (paymentMethod == 'QRIS') horizontalSpaces(14),
              Text(
                paymentMethod == 'QRIS' ? 'QRIS' : 'Uang Tunai',
                style: ClinicTextStyle.h4Regular(),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => selectPaymentMethodModal(
                  context: context,
                  grossAmount: medicalRecord.patientReservation.totalPrice!,
                  medicalRecord: medicalRecord,
                  onTapQRIS: onTapQRIS,
                  onTapTunai: onTapTunai,
                ),
                child: Text(
                  'Ubah Metode',
                  style: ClinicTextStyle.h5SemiBold().copyWith(color: ClinicColor.grey),
                ),
              )
            ],
          ),
          Divider(color: ClinicColor.border),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total :',
                style: ClinicTextStyle.h4Regular(),
              ),
              Text(
                rupiahFormatter(
                  medicalRecord.patientReservation.totalPrice.toString(),
                ),
                style: ClinicTextStyle.h4SemiBold().copyWith(
                  color: ClinicColor.primary,
                ),
              ),
            ],
          ),
          if (paymentMethod == 'Tunai')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dibayarkan :',
                  style: ClinicTextStyle.h4Regular(),
                ),
                Text(
                  rupiahFormatter(
                    medicalRecord.patientReservation.totalPrice.toString(),
                  ),
                  style: ClinicTextStyle.h4SemiBold().copyWith(
                    color: ClinicColor.primary,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
