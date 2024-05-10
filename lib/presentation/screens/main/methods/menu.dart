import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/clinic_services_screen.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/medical_records_screen.dart';
import 'package:flutter_clinic/presentation/screens/patient_reservation/patient_reservations_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';
import '../../../widgets/menu_card.dart';
import '../../master/doctor/doctors_screen.dart';
import '../../master/doctor_schedule/doctor_schedules_screen.dart';
import '../../master/patient/patients_screen.dart';
import '../../transaction/transactions_screen.dart';
import '../services/main_service.dart';

List<Widget> menu({
  required BuildContext context,
  required User? user,
}) =>
    [
      verticalSpace(24),
      Text(
        'Menu',
        style: ClinicTextStyle.h4SemiBold().copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      verticalSpace(7),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 130,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            crossAxisSpacing: 14,
            mainAxisSpacing: 7,
          ),
          itemCount: MainService.menus().length,
          itemBuilder: (context, index) {
            return MenuCard(
              iconPath: MainService.menus()[index]['iconPath'],
              label: MainService.menus()[index]['label'],
              onTap: () {
                switch (index) {
                  case 0:
                    context.goNamed(DoctorsScreen.routerName);
                    break;
                  case 1:
                    context.goNamed(PatientsScreen.routerName);
                    break;
                  case 2:
                    context.goNamed(DoctorSchedulesScreen.routerName);
                    break;
                  case 3:
                    context.goNamed(ClinicServicesScreen.routerName);
                    break;
                  case 4:
                    context.goNamed(PatientReservationsScreen.routerName);
                    break;
                  case 5:
                    context.goNamed(MedicalRecordsScreen.routerName);
                    break;
                  case 6:
                    if (user != null && user.role != 'dokter') {
                      context.goNamed(TransactionsScreen.routerName);
                    } else {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            title: Center(
                              child: Text(
                                'Menu Terkunci',
                                style: ClinicTextStyle.h3SemiBold(),
                              ),
                            ),
                            content: Text(
                              'Maaf, akun anda tidak dapat mengkases menu ini! \nTerima kasih',
                              style: ClinicTextStyle.h4Regular(),
                              textAlign: TextAlign.center,
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () => context.pop(),
                                  child: const Text('Oke'),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    break;
                }
              },
            );
          },
        ),
      ),
      verticalSpace(24),
    ];
