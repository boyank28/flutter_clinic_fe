import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/user.dart';

import '../../../../blocs/master/clinic_service/get_clinic_services_bloc/get_clinic_services_bloc.dart';
import '../../../../extension/clinic_loading.dart';
import '../../../../widgets/clinic_service_card.dart';

Widget servicesTabBar({
  required TabController? tabController,
  required User? user,
  required GlobalKey<RefreshIndicatorState> refreshIndicatorKey,
}) =>
    TabBarView(
      controller: tabController,
      children: [
        BlocBuilder<GetClinicServicesBloc, GetClinicServicesState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => ClinicLoading.shimmer(context),
              success: (clinicServices) => ListView(
                children: clinicServices
                    .where((element) => element.category == 'Obat-Obatan')
                    .map((e) => ClinicServiceCard(
                          service: e,
                          user: user,
                        ))
                    .toList(),
              ),
            );
          },
        ),
        BlocBuilder<GetClinicServicesBloc, GetClinicServicesState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => ClinicLoading.shimmer(context),
              success: (clinicServices) => ListView(
                children: clinicServices
                    .where((element) => element.category == 'Treatment')
                    .map((e) => ClinicServiceCard(
                          service: e,
                          user: user,
                        ))
                    .toList(),
              ),
            );
          },
        ),
        BlocBuilder<GetClinicServicesBloc, GetClinicServicesState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => ClinicLoading.shimmer(context),
              success: (clinicServices) => ListView(
                children: clinicServices
                    .where((element) => element.category == 'Konsultasi')
                    .map((e) => ClinicServiceCard(
                          service: e,
                          user: user,
                        ))
                    .toList(),
              ),
            );
          },
        ),
      ],
    );
