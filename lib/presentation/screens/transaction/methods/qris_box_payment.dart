import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';

import '../../../blocs/payment/qris_qr_generate_bloc/qris_qr_generate_bloc.dart';
import '../../../extension/clinic_loading.dart';
import '../../../extension/rupiah_formatter.dart';
import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';
import '../../medical_record/methods/back_button.dart';
import '../../medical_record/methods/select_payment_method_modal.dart';

Widget qrisBoxPayment({
  required BuildContext context,
  required MedicalRecord medicalRecord,
  required VoidCallback onTapQRIS,
  required VoidCallback onTapTunai,
}) =>
    Center(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 1.3,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: ClinicColor.primary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInImage(
                      alignment: Alignment.centerLeft,
                      placeholder: AssetImage('assets/images/img_placeholder.png'),
                      image: AssetImage('assets/images/img_qris_white.png'),
                      fit: BoxFit.fitHeight,
                      height: 30,
                      fadeInDuration: Duration(milliseconds: 300),
                      fadeOutDuration: Duration(milliseconds: 300),
                    ),
                    FadeInImage(
                      alignment: Alignment.centerLeft,
                      placeholder: AssetImage('assets/images/img_placeholder.png'),
                      image: AssetImage('assets/images/img_gpn.png'),
                      fit: BoxFit.fitHeight,
                      height: 50,
                      fadeInDuration: Duration(milliseconds: 300),
                      fadeOutDuration: Duration(milliseconds: 300),
                    ),
                  ],
                ),
                verticalSpace(14),
                Text(
                  'PT. Medical Healthcare',
                  style: ClinicTextStyle.h3Bold().copyWith(color: ClinicColor.white),
                ),
                Text(
                  'NMID: ID11920192287A01',
                  style: ClinicTextStyle.h4Regular().copyWith(color: ClinicColor.white),
                ),
                verticalSpace(24),
                Container(
                  width: MediaQuery.of(context).size.height / 3.5,
                  height: MediaQuery.of(context).size.height / 3.5,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: ClinicColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: BlocBuilder<QrisQrGenerateBloc, QrisQrGenerateState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClinicLoading.textButtonCircular(),
                            Text(
                              'Sedang generate QR Code',
                              style: ClinicTextStyle.h5Regular(),
                            )
                          ],
                        ),
                        success: (generateResult) => FadeInImage(
                          alignment: Alignment.centerLeft,
                          placeholder: const AssetImage('assets/images/img_placeholder.png'),
                          image: NetworkImage(generateResult.actions.first.url),
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration(milliseconds: 300),
                          fadeOutDuration: const Duration(milliseconds: 300),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ClinicColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const FadeInImage(
                            alignment: Alignment.centerLeft,
                            placeholder: AssetImage('assets/images/img_placeholder.png'),
                            image: AssetImage('assets/images/img_qris.png'),
                            fit: BoxFit.fitHeight,
                            height: 20,
                            fadeInDuration: Duration(milliseconds: 300),
                            fadeOutDuration: Duration(milliseconds: 300),
                          ),
                          horizontalSpaces(14),
                          Text(
                            'QRIS',
                            style: ClinicTextStyle.h4Regular().copyWith(color: ClinicColor.black),
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
                            style: ClinicTextStyle.h4Regular().copyWith(color: ClinicColor.black),
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
                ),
                verticalSpace(14),
              ],
            ),
          ),
          verticalSpace(24),
          backButton(context),
        ],
      ),
    );
