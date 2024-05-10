import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/data/datasources/auth/auth_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/master/clinic_service/clinic_service_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/master/doctor/doctor_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/master/doctor_schedule/doctor_schedule_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/master/patient/patient_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/patient_reservation/patient_reservation_external_datasource.dart';
import 'package:flutter_clinic/presentation/blocs/master/clinic_service/get_clinic_services_bloc/get_clinic_services_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/master/doctor_schedule/get_doctor_schedules_bloc/get_doctor_schedules_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/master/patient/get_patients_bloc/get_patients_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/patient_reservation/get_patient_reservations_bloc/get_patient_reservations_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/theme/toggle_theme_bloc/toggle_theme_bloc.dart';
import 'package:flutter_clinic/presentation/misc/clinic_theme.dart';
import 'package:flutter_clinic/router/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'common/http_override.dart';
import 'presentation/blocs/auth/get_user/get_user_bloc.dart';
import 'presentation/blocs/master/doctor/get_doctors_bloc/get_doctors_bloc.dart';

Future<void> main() async {
  initializeDateFormatting();
  HttpOverrides.global = MyHttpOverrides();

  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserBloc(AuthExternalDatasource()),
        ),
        BlocProvider(
          create: (context) => GetDoctorsBloc(DoctorExternalDatasource()),
        ),
        BlocProvider(
          create: (context) => GetPatientsBloc(PatientExternalDatasource()),
        ),
        BlocProvider(
          create: (context) => GetClinicServicesBloc(ClinicServiceExternalDatasource()),
        ),
        BlocProvider(
          create: (context) => GetDoctorSchedulesBloc(DoctorScheduleExternalDatasource()),
        ),
        BlocProvider(
          create: (context) => GetPatientReservationsBloc(PatientReservationExternalDatasource()),
        ),
        BlocProvider(
          create: (context) => ToggleThemeBloc(),
        ),
      ],
      child: BlocBuilder<ToggleThemeBloc, ToggleThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Clinic App',
            theme: state.maybeWhen(
              orElse: () => ClinicTheme.lightTheme(),
              themeResult: (themeResult) => themeResult,
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
