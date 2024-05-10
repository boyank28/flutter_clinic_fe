import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/misc/clinic_textstyle.dart';
import 'package:flutter_clinic/presentation/widgets/doctor_card.dart';

import '../../../../blocs/master/doctor/get_doctors_bloc/get_doctors_bloc.dart';
import '../../../../extension/clinic_loading.dart';
import '../../../../misc/clinic_color.dart';

Widget doctorList({
  required ScrollController scrollC,
  required User? user,
  required GlobalKey<RefreshIndicatorState> refreshIndicatorKey,
}) =>
    BlocBuilder<GetDoctorsBloc, GetDoctorsState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => ClinicLoading.shimmer(context),
          failed: (message) => Center(
            child: Text(
              message,
              style: ClinicTextStyle.h4SemiBold(),
            ),
          ),
          success: (doctors, isNext) {
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
                      context.read<GetDoctorsBloc>().add(const GetDoctorsEvent.getFirst(name: ''));
                    },
                  );
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollC,
                    itemCount: doctors.length + 1,
                    itemBuilder: (context, index) {
                      if (index < doctors.length) {
                        return DoctorCard(
                          doctor: doctors[index],
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
