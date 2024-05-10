import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';

import '../../../blocs/payment/create_payment_bloc/create_payment_bloc.dart';
import '../../../extension/clinic_form.dart';
import '../../../extension/rupiah_formatter.dart';
import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';
import '../../medical_record/methods/back_button.dart';
import '../../medical_record/methods/select_payment_method_modal.dart';

Widget tunaiBoxPayment({
  required BuildContext context,
  required MedicalRecord medicalRecord,
  required TextEditingController cashC,
  required VoidCallback onTapQRIS,
  required VoidCallback onTapTunai,
  required VoidCallback onConfirmation,
  required Widget cashAmount,
  required String cashback,
  required Function(String value)? onChanged,
}) =>
    Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: ClinicColor.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: ClinicColor.border),
              ),
              child: Column(
                children: [
                  Text(
                    'Pembayaran Tunai',
                    style: ClinicTextStyle.h3SemiBold().copyWith(color: ClinicColor.black),
                  ),
                  verticalSpace(24),
                  ClinicForm(
                    controller: cashC,
                    label: 'Masukkan Nominal',
                    hintText: 'cth: 100000',
                    keyboardType: TextInputType.number,
                    onChanged: onChanged,
                    textColor: ClinicColor.black,
                  ),
                  verticalSpace(14),
                  cashAmount,
                  verticalSpace(24),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ClinicColor.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: ClinicColor.border),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Uang Tunai',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dibayarkan :',
                              style: ClinicTextStyle.h4Regular().copyWith(color: ClinicColor.black),
                            ),
                            Text(
                              rupiahFormatter(
                                cashC.text.isEmpty ? '0' : cashC.text,
                              ),
                              style: ClinicTextStyle.h4SemiBold().copyWith(
                                color: ClinicColor.primary,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: ClinicColor.border),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kembali :',
                              style: ClinicTextStyle.h4Regular().copyWith(color: ClinicColor.black),
                            ),
                            Text(
                              rupiahFormatter(cashback),
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
                  BlocBuilder<CreatePaymentBloc, CreatePaymentState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => ElevatedButton(
                          onPressed: onConfirmation,
                          child: const Text('Konfirmasi'),
                        ),
                        loading: () => ClinicLoading.buttonCircular(),
                      );
                    },
                  ),
                  verticalSpace(14),
                ],
              ),
            ),
            verticalSpace(24),
            backButton(context),
          ],
        ),
      ),
    );
