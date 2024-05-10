import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/widgets/patient_card.dart';

import '../../../../blocs/master/patient/get_patients_bloc/get_patients_bloc.dart';
import '../../../../extension/clinic_loading.dart';
import '../../../../misc/clinic_color.dart';

Widget patientList({
  required ScrollController scrollC,
  required User? user,
  required GlobalKey<RefreshIndicatorState> refreshIndicatorKey,
}) =>
    BlocBuilder<GetPatientsBloc, GetPatientsState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => ClinicLoading.shimmer(context),
          success: (patients, isNext) {
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
                      context.read<GetPatientsBloc>().add(const GetPatientsEvent.getFirst(patient: ''));
                    },
                  );
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollC,
                    itemCount: patients.length + 1,
                    itemBuilder: (context, index) {
                      if (index < patients.length) {
                        return PatientCard(
                          patient: patients[index],
                          user: user,
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
    );
