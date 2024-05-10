import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/medical_record/get_medical_records_bloc/get_medical_records_bloc.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';
import 'package:flutter_clinic/presentation/misc/clinic_textstyle.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/detail_medical_record_screen.dart';
import 'package:flutter_clinic/presentation/widgets/medical_record_card.dart';
import 'package:go_router/go_router.dart';

import '../../extension/clinic_loading.dart';
import '../../extension/search_form.dart';
import '../../misc/spacing.dart';

class MedicalRecordsScreen extends StatefulWidget {
  static const routerName = 'medical-records';
  const MedicalRecordsScreen({super.key});

  @override
  State<MedicalRecordsScreen> createState() => _MedicalRecordsScreenState();
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  TextEditingController mrSearchC = TextEditingController();
  ScrollController scrollC = ScrollController();
  bool isNext = false;

  @override
  void initState() {
    context.read<GetMedicalRecordsBloc>().add(const GetMedicalRecordsEvent.getFirst(record: ''));
    scrollC.addListener(() {
      if (scrollC.position.maxScrollExtent == scrollC.offset) {
        isNext = context.read<GetMedicalRecordsBloc>().isNext;
        if (isNext) {
          context.read<GetMedicalRecordsBloc>().add(GetMedicalRecordsEvent.getNext(record: mrSearchC.text));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClinicColor.primary,
        foregroundColor: ClinicColor.white,
        title: Text(
          'Medical Records',
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
              searchC: mrSearchC,
              hintText: 'Ketik nama atau NIK pasien...',
              label: 'Cari Medical Record',
              debouncerFunc: () => context.read<GetMedicalRecordsBloc>().add(
                    GetMedicalRecordsEvent.getFirst(record: mrSearchC.text),
                  ),
              suffixOnPressed: () => context.read<GetMedicalRecordsBloc>().add(
                    GetMedicalRecordsEvent.getFirst(record: mrSearchC.text),
                  ),
              onSubmitted: (value) => context.read<GetMedicalRecordsBloc>().add(
                    GetMedicalRecordsEvent.getFirst(record: value),
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
                    'Data Medical Record',
                    style: ClinicTextStyle.h4SemiBold(),
                  ),
                  Divider(
                    color: ClinicColor.border,
                  ),
                  verticalSpace(14),
                  BlocBuilder<GetMedicalRecordsBloc, GetMedicalRecordsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => ClinicLoading.shimmer(context),
                        success: (medicalRecords, isNext) {
                          return Expanded(
                            child: RefreshIndicator(
                              key: refreshIndicatorKey,
                              backgroundColor: ClinicColor.white,
                              color: ClinicColor.primary,
                              strokeWidth: 3,
                              onRefresh: () async {
                                await Future.delayed(
                                  const Duration(seconds: 0),
                                  () {
                                    context
                                        .read<GetMedicalRecordsBloc>()
                                        .add(GetMedicalRecordsEvent.getFirst(record: mrSearchC.text));
                                  },
                                );
                              },
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  controller: scrollC,
                                  itemCount: medicalRecords.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index < medicalRecords.length) {
                                      return MedicalRecordCard(
                                        medicalRecord: medicalRecords[index],
                                        onTap: () => context.pushNamed(
                                          DetailMedicalRecordScreen.routerName,
                                          queryParameters: {
                                            'reservationId': medicalRecords[index].patientReservation.id.toString(),
                                          },
                                        ),
                                      );
                                    } else if (isNext) {
                                      return ClinicLoading.loadData(context);
                                    } else {
                                      return ClinicLoading.noDataMore(context);
                                    }
                                  }),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  // patientList(scrollC: scrollC),
                  // doctorList(scrollC: scrollC),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
