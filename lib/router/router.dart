import 'package:flutter/material.dart';
import 'package:flutter_clinic/data/datasources/master/clinic_service/clinic_service_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/master/doctor/doctor_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/master/patient/patient_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/medical_record/medical_record_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/patient_reservation/patient_reservation_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/payment/payment_external_datasource.dart';
import 'package:flutter_clinic/data/datasources/satu_sehat/satu_sehat_external_datasource.dart';
import 'package:flutter_clinic/domain/entities/clinic_service.dart';
import 'package:flutter_clinic/domain/entities/doctor.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';
import 'package:flutter_clinic/domain/entities/patient.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/presentation/blocs/auth/login/login_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/master/doctor/update_doctor/update_doctor_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/master/patient/update_patient_bloc/update_patient_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/medical_record/get_mr_by_reservation_id_bloc/get_mr_by_reservation_id_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/patient_reservation/create_patient_reservation_bloc/create_patient_reservation_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/payment/check_payment_status_bloc/check_payment_status_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/payment/create_payment_bloc/create_payment_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/satu_sehat/ss_get_cities_bloc/ss_get_cities_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/satu_sehat/ss_get_districts_bloc/ss_get_districts_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/satu_sehat/ss_get_provinces_bloc/ss_get_provinces_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/satu_sehat/ss_get_sub_districts_bloc/ss_get_sub_districts_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/satu_sehat/ss_get_token_bloc/ss_get_token_bloc.dart';
import 'package:flutter_clinic/presentation/screens/login/login_screen.dart';
import 'package:flutter_clinic/presentation/screens/main/main_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/add_clinic_service_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/clinic_services_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/edit_clinic_service_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/add_doctor_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/doctors_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/edit_doctor_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor_schedule/doctor_schedules_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/add_patient_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/edit_patient_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/patients_screen.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/add_medical_record_screen.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/medical_records_screen.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/select_clinic_services_screen.dart';
import 'package:flutter_clinic/presentation/screens/patient_reservation/add_patient_reservation_screen.dart';
import 'package:flutter_clinic/presentation/screens/patient_reservation/patient_reservations_screen.dart';
import 'package:flutter_clinic/presentation/screens/splash/splash_screen.dart';
import 'package:flutter_clinic/presentation/screens/transaction/checkout_transaction_screen.dart';
import 'package:flutter_clinic/presentation/screens/transaction/transactions_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/datasources/auth/auth_external_datasource.dart';
import '../presentation/blocs/master/clinic_service/create_clinic_service_bloc/create_clinic_service_bloc.dart';
import '../presentation/blocs/master/clinic_service/update_clinic_service_bloc/update_clinic_service_bloc.dart';
import '../presentation/blocs/master/doctor/create_doctor_bloc/create_doctor_bloc.dart';
import '../presentation/blocs/master/patient/create_patient_bloc/create_patient_bloc.dart';
import '../presentation/blocs/medical_record/create_medical_record_bloc/create_medical_record_bloc.dart';
import '../presentation/blocs/medical_record/get_medical_records_bloc/get_medical_records_bloc.dart';
import '../presentation/blocs/payment/get_payments_bloc/get_payments_bloc.dart';
import '../presentation/blocs/payment/qris_qr_generate_bloc/qris_qr_generate_bloc.dart';
import '../presentation/screens/medical_record/detail_medical_record_screen.dart';

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
    );

GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: routerKey,
  routes: [
    // Splash
    GoRoute(
      path: SplashScreen.routerName,
      name: SplashScreen.routerName,
      builder: (context, state) => const SplashScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SplashScreen(),
      ),
    ),
    // Login
    GoRoute(
      path: LoginScreen.routerName,
      name: LoginScreen.routerName,
      builder: (context, state) => const LoginScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (context) => LoginBloc(AuthExternalDatasource()),
          child: const LoginScreen(),
        ),
      ),
    ),
    // Main
    GoRoute(
      path: MainScreen.routerName,
      name: MainScreen.routerName,
      builder: (context, state) => const MainScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (context) => SsGetTokenBloc(SatuSehatExternalDatasource()),
          child: const MainScreen(),
        ),
      ),
      routes: [
        // Master Dokter
        GoRoute(
          path: DoctorsScreen.routerName,
          name: DoctorsScreen.routerName,
          builder: (context, state) => const DoctorsScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const DoctorsScreen(),
          ),
          routes: [
            // Add Dokter
            GoRoute(
              path: AddDoctorScreen.routerName,
              name: AddDoctorScreen.routerName,
              builder: (context, state) => const AddDoctorScreen(),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: BlocProvider(
                  create: (context) => CreateDoctorBloc(DoctorExternalDatasource()),
                  child: const AddDoctorScreen(),
                ),
              ),
            ),
            // Edit Dokter
            GoRoute(
              path: EditDoctorScreen.routerName,
              name: EditDoctorScreen.routerName,
              builder: (context, state) => EditDoctorScreen(doctor: state.extra as Doctor),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: BlocProvider(
                  create: (context) => UpdateDoctorBloc(DoctorExternalDatasource()),
                  child: EditDoctorScreen(doctor: state.extra as Doctor),
                ),
              ),
            ),
          ],
        ),
        // Master Pasien
        GoRoute(
          path: PatientsScreen.routerName,
          name: PatientsScreen.routerName,
          builder: (context, state) => const PatientsScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const PatientsScreen(),
          ),
          routes: [
            // Add Pasien
            GoRoute(
              path: AddPatientScreen.routerName,
              name: AddPatientScreen.routerName,
              builder: (context, state) => const AddPatientScreen(),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CreatePatientBloc(PatientExternalDatasource()),
                    ),
                    BlocProvider(
                      create: (context) => SsGetProvincesBloc(SatuSehatExternalDatasource()),
                    ),
                    BlocProvider(
                      create: (context) => SsGetCitiesBloc(SatuSehatExternalDatasource()),
                    ),
                    BlocProvider(
                      create: (context) => SsGetDistrictsBloc(SatuSehatExternalDatasource()),
                    ),
                    BlocProvider(
                      create: (context) => SsGetSubDistrictsBloc(SatuSehatExternalDatasource()),
                    ),
                    BlocProvider(
                      create: (context) => SsGetTokenBloc(SatuSehatExternalDatasource()),
                      child: const MainScreen(),
                    )
                  ],
                  child: const AddPatientScreen(),
                ),
              ),
            ),
            // Edit Pasien
            GoRoute(
              path: EditPatientScreen.routerName,
              name: EditPatientScreen.routerName,
              builder: (context, state) => EditPatientScreen(patient: state.extra as Patient),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => UpdatePatientBloc(PatientExternalDatasource()),
                    ),
                    BlocProvider(
                      create: (context) => SsGetProvincesBloc(SatuSehatExternalDatasource()),
                    ),
                    BlocProvider(
                      create: (context) => SsGetCitiesBloc(SatuSehatExternalDatasource()),
                    ),
                    BlocProvider(
                      create: (context) => SsGetDistrictsBloc(SatuSehatExternalDatasource()),
                    ),
                    BlocProvider(
                      create: (context) => SsGetSubDistrictsBloc(SatuSehatExternalDatasource()),
                    ),
                  ],
                  child: EditPatientScreen(patient: state.extra as Patient),
                ),
              ),
            ),
          ],
        ),
        // Master Layanan Klinik
        GoRoute(
          path: ClinicServicesScreen.routerName,
          name: ClinicServicesScreen.routerName,
          builder: (context, state) => const ClinicServicesScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: BlocProvider(
              create: (context) => CreatePatientBloc(PatientExternalDatasource()),
              child: const ClinicServicesScreen(),
            ),
          ),
          routes: [
            // Add Layanan Klinik
            GoRoute(
              path: AddClinicServiceScreen.routerName,
              name: AddClinicServiceScreen.routerName,
              builder: (context, state) => const AddClinicServiceScreen(),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: BlocProvider(
                  create: (context) => CreateClinicServiceBloc(ClinicServiceExternalDatasource()),
                  child: const AddClinicServiceScreen(),
                ),
              ),
            ),
            // Edit Layanan Klinik
            GoRoute(
              path: EditClinicServiceScreen.routerName,
              name: EditClinicServiceScreen.routerName,
              builder: (context, state) => EditClinicServiceScreen(clinicService: state.extra as ClinicService),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: BlocProvider(
                  create: (context) => UpdateClinicServiceBloc(ClinicServiceExternalDatasource()),
                  child: EditClinicServiceScreen(clinicService: state.extra as ClinicService),
                ),
              ),
            )
          ],
        ),
        // Master Jadwal Dokter
        GoRoute(
          path: DoctorSchedulesScreen.routerName,
          name: DoctorSchedulesScreen.routerName,
          builder: (context, state) => const DoctorSchedulesScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: BlocProvider(
              create: (context) => CreatePatientBloc(PatientExternalDatasource()),
              child: const DoctorSchedulesScreen(),
            ),
          ),
        ),
        // Reservasi Pasien
        GoRoute(
          path: PatientReservationsScreen.routerName,
          name: PatientReservationsScreen.routerName,
          builder: (context, state) => const PatientReservationsScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const PatientReservationsScreen(),
          ),
          routes: [
            // Add Patient Reservation
            GoRoute(
              path: AddPatientReservationScreen.routerName,
              name: AddPatientReservationScreen.routerName,
              builder: (context, state) => AddPatientReservationScreen(patient: state.extra as Patient),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: BlocProvider(
                  create: (context) => CreatePatientReservationBloc(PatientReservationExternalDatasource()),
                  child: AddPatientReservationScreen(patient: state.extra as Patient),
                ),
              ),
            ),
            // Add Medical Record
            GoRoute(
              path: AddMedicalRecordScreen.routerName,
              name: AddMedicalRecordScreen.routerName,
              builder: (context, state) => AddMedicalRecordScreen(
                patientReservation: state.extra as PatientReservation,
              ),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: BlocProvider(
                  create: (context) => CreateMedicalRecordBloc(MedicalRecordExternalDatasource()),
                  child: AddMedicalRecordScreen(
                    patientReservation: state.extra as PatientReservation,
                  ),
                ),
              ),
            ),
            // Detail Medical Record
            GoRoute(
              path: DetailMedicalRecordScreen.routerName,
              name: DetailMedicalRecordScreen.routerName,
              builder: (context, state) => DetailMedicalRecordScreen(
                reservationId: state.uri.queryParameters['reservationId']!,
              ),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: BlocProvider(
                  create: (context) => GetMrByReservationIdBloc(MedicalRecordExternalDatasource()),
                  child: DetailMedicalRecordScreen(
                    reservationId: state.uri.queryParameters['reservationId']!,
                  ),
                ),
              ),
            ),
            // Select Clinic Services
            GoRoute(
              path: SelectClinicServicesScreen.routerName,
              name: SelectClinicServicesScreen.routerName,
              builder: (context, state) => const SelectClinicServicesScreen(),
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const SelectClinicServicesScreen(),
              ),
            ),
          ],
        ),
        // Medical Record
        GoRoute(
          path: MedicalRecordsScreen.routerName,
          name: MedicalRecordsScreen.routerName,
          builder: (context, state) => const MedicalRecordsScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: BlocProvider(
                create: (context) => GetMedicalRecordsBloc(MedicalRecordExternalDatasource()),
                child: const MedicalRecordsScreen(),
              )),
        ),
        // Transaksi
        GoRoute(
            path: TransactionsScreen.routerName,
            name: TransactionsScreen.routerName,
            builder: (context, state) => const TransactionsScreen(),
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: BlocProvider(
                    create: (context) => GetPaymentsBloc(PaymentExternalDatasource()),
                    child: const TransactionsScreen(),
                  ),
                ),
            routes: [
              // Checkout Transaksi
              GoRoute(
                path: CheckoutTransactionScreen.routerName,
                name: CheckoutTransactionScreen.routerName,
                builder: (context, state) => CheckoutTransactionScreen(
                  medicalRecord: state.extra as MedicalRecord,
                  paymentMethod: state.uri.queryParameters['paymentMethod']!,
                ),
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => CreatePaymentBloc(PaymentExternalDatasource()),
                      ),
                      BlocProvider(
                        create: (context) => QrisQrGenerateBloc(PaymentExternalDatasource()),
                      ),
                      BlocProvider(
                        create: (context) => CheckPaymentStatusBloc(PaymentExternalDatasource()),
                      ),
                    ],
                    child: CheckoutTransactionScreen(
                      medicalRecord: state.extra as MedicalRecord,
                      paymentMethod: state.uri.queryParameters['paymentMethod']!,
                    ),
                  ),
                ),
              ),
            ]),
      ],
    ),
  ],
);
