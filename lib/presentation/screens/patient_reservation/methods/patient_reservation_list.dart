import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/presentation/screens/patient_reservation/patient_reservation_service.dart';
import 'package:flutter_clinic/presentation/widgets/empty_data.dart';

import '../../../blocs/patient_reservation/get_patient_reservations_bloc/get_patient_reservations_bloc.dart';
import '../../../extension/clinic_loading.dart';
import '../../../extension/datetime_formatter.dart';
import '../../../misc/clinic_color.dart';
import '../../../widgets/patient_reservation_card.dart';

Widget patientReservationList({
  required BuildContext context,
  required GlobalKey<RefreshIndicatorState> refreshIndicatorKey,
}) =>
    Expanded(
      child: RefreshIndicator(
        key: refreshIndicatorKey,
        backgroundColor: ClinicColor.white,
        color: ClinicColor.primary,
        strokeWidth: 3,
        onRefresh: () async {
          await Future.delayed(
            const Duration(seconds: 0),
            () {
              context.read<GetPatientReservationsBloc>().add(const GetPatientReservationsEvent.doGet(patient: ''));
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<GetPatientReservationsBloc, GetPatientReservationsState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => ClinicLoading.shimmer(context),
                  success: (patientReservations) {
                    List<PatientReservation> todayReservations = patientReservations
                        .where((element) =>
                            DateTimeFormatter.dMMMMyyy(element.scheduleTime) ==
                            DateTimeFormatter.dMMMMyyy(DateTime.now().toString()))
                        .toList();

                    if (todayReservations.isEmpty) {
                      return EmptyData(
                        message: 'Belum ada reservasi hari ini',
                        onPressed: () {
                          context
                              .read<GetPatientReservationsBloc>()
                              .add(const GetPatientReservationsEvent.doGet(patient: ''));
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: todayReservations.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PatientReservationCard(
                            patientReservation: todayReservations[index],
                            statusColor: PatientReservationService.statusColor(todayReservations[index].status),
                          );
                        },
                      );
                    }
                  });
            },
          ),
        ),
      ),
    );
