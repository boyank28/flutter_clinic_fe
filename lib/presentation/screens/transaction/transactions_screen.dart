import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/payment/get_payments_bloc/get_payments_bloc.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';
import 'package:flutter_clinic/presentation/misc/clinic_textstyle.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/detail_medical_record_screen.dart';
import 'package:flutter_clinic/presentation/widgets/empty_data.dart';
import 'package:flutter_clinic/presentation/widgets/transaction_card.dart';
import 'package:go_router/go_router.dart';

import '../../extension/clinic_loading.dart';
import '../../extension/search_form.dart';
import '../../misc/spacing.dart';

class TransactionsScreen extends StatefulWidget {
  static const routerName = 'transactions';
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  TextEditingController searchC = TextEditingController();

  @override
  void initState() {
    context.read<GetPaymentsBloc>().add(
          const GetPaymentsEvent.doGet(payment: ''),
        );
    super.initState();
  }

  @override
  void dispose() {
    searchC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClinicColor.primary,
        foregroundColor: ClinicColor.white,
        title: Text(
          'Transaksi',
          style: ClinicTextStyle.h3SemiBold(),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: SearchForm(
              searchC: searchC,
              hintText: 'Ketik nama atau NIK pasien...',
              label: 'Cari Transaksi',
              debouncerFunc: () => context.read<GetPaymentsBloc>().add(
                    GetPaymentsEvent.doGet(payment: searchC.text),
                  ),
              suffixOnPressed: () => context.read<GetPaymentsBloc>().add(
                    GetPaymentsEvent.doGet(payment: searchC.text),
                  ),
              onSubmitted: (value) => context.read<GetPaymentsBloc>().add(
                    GetPaymentsEvent.doGet(payment: value),
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data Transaksi',
                    style: ClinicTextStyle.h4SemiBold(),
                  ),
                  Divider(
                    color: ClinicColor.border,
                  ),
                  verticalSpace(14),
                  BlocBuilder<GetPaymentsBloc, GetPaymentsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => ClinicLoading.shimmer(context),
                        success: (payments) {
                          if (payments.isEmpty) {
                            return Expanded(
                              child: EmptyData(
                                message: 'Belum ada data transaksi',
                                onPressed: () => context.read<GetPaymentsBloc>().add(
                                      const GetPaymentsEvent.doGet(payment: ''),
                                    ),
                              ),
                            );
                          } else {
                            return Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: payments.length,
                                  itemBuilder: (context, index) {
                                    return TransactionCard(
                                      payment: payments[index],
                                      onTap: () => context.pushNamed(
                                        DetailMedicalRecordScreen.routerName,
                                        queryParameters: {
                                          'reservationId': payments[index].patientReservation.id.toString(),
                                        },
                                      ),
                                    );
                                  }),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
