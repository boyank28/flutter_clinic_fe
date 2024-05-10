import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/master/doctor_schedule/get_doctor_schedules_bloc/get_doctor_schedules_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor_schedule/methods/doctor_schedules_appbar.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor_schedule/methods/notes.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor_schedule/methods/schedule_datatable.dart';
import 'package:flutter_clinic/presentation/widgets/empty_data.dart';

import 'service/doctor_schedule_service.dart';

class DoctorSchedulesScreen extends StatefulWidget {
  static const routerName = 'doctor-schedule';
  const DoctorSchedulesScreen({super.key});

  @override
  State<DoctorSchedulesScreen> createState() => _DoctorSchedulesScreenState();
}

class _DoctorSchedulesScreenState extends State<DoctorSchedulesScreen> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    context.read<GetDoctorSchedulesBloc>().add(const GetDoctorSchedulesEvent.getAll(name: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: doctorSchedulesAppbar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<GetDoctorSchedulesBloc, GetDoctorSchedulesState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => ClinicLoading.shimmer(context),
                success: (doctorSchedules) {
                  // Kelompokkan jadwal berdasarkan hari

                  // Mencari nilai maksimal untuk jadwal terbanyak dalam 1 hari
                  int maxScedulePerDay = DoctorScheduleService.doctorScheduleList(doctorSchedules);

                  if (doctorSchedules.isEmpty) {
                    return EmptyData(
                      message: 'Belum ada jadwal dokter',
                      onPressed: () {
                        context.read<GetDoctorSchedulesBloc>().add(const GetDoctorSchedulesEvent.getAll(name: ''));
                      },
                    );
                  } else {
                    return RefreshIndicator(
                      key: refreshIndicatorKey,
                      backgroundColor: ClinicColor.white,
                      color: ClinicColor.primary,
                      strokeWidth: 3,
                      onRefresh: () async {
                        await Future.delayed(
                          const Duration(seconds: 0),
                          () {
                            context.read<GetDoctorSchedulesBloc>().add(const GetDoctorSchedulesEvent.getAll(name: ''));
                          },
                        );
                      },
                      child: ListView(
                        children: [
                          ...notes(),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: scheduleDatatable(
                                  context: context,
                                  maxScedulePerDay: maxScedulePerDay,
                                  sundaySceduleLength: DoctorScheduleService.sundaySchedule(doctorSchedules).length,
                                  mondaySceduleLength: DoctorScheduleService.mondaySchedule(doctorSchedules).length,
                                  tuesdaySceduleLength: DoctorScheduleService.tuesdaySchedule(doctorSchedules).length,
                                  wednesdaySceduleLength:
                                      DoctorScheduleService.wednesdaySchedule(doctorSchedules).length,
                                  thursdaySceduleLength: DoctorScheduleService.thursdaySchedule(doctorSchedules).length,
                                  fridaySceduleLength: DoctorScheduleService.fridaySchedule(doctorSchedules).length,
                                  saturdaySceduleLength: DoctorScheduleService.saturdaySchedule(doctorSchedules).length,
                                  sundayScedule: DoctorScheduleService.sundaySchedule(doctorSchedules),
                                  mondayScedule: DoctorScheduleService.mondaySchedule(doctorSchedules),
                                  tuesdayScedule: DoctorScheduleService.tuesdaySchedule(doctorSchedules),
                                  wednesdayScedule: DoctorScheduleService.wednesdaySchedule(doctorSchedules),
                                  thursdayScedule: DoctorScheduleService.thursdaySchedule(doctorSchedules),
                                  fridayScedule: DoctorScheduleService.fridaySchedule(doctorSchedules),
                                  saturdayScedule: DoctorScheduleService.saturdaySchedule(doctorSchedules))),
                        ],
                      ),
                    );
                  }
                });
          },
        ),
      ),
    );
  }
}
