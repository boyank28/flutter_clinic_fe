import 'package:flutter/material.dart';

import '../../../../domain/entities/patient.dart';
import '../../../../domain/entities/patient_reservation.dart';
import '../../../extension/datetime_formatter.dart';
import '../../../widgets/clinic_information_card.dart';
import '../services/main_service.dart';

Widget clinicInformation({
  required List<Patient> patients,
  required List<PatientReservation> patientReservations,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        MainService.clinicInformationData().length,
        (index) {
          switch (index) {
            case 0:
              return ClinicInformationCard(
                iconPath: MainService.clinicInformationData()[index]['iconPath'],
                title: MainService.clinicInformationData()[index]['title'],
                qty: patients.length.toString(),
              );
            case 1:
              return ClinicInformationCard(
                iconPath: MainService.clinicInformationData()[index]['iconPath'],
                title: MainService.clinicInformationData()[index]['title'],
                qty: patientReservations
                    .where((element) =>
                        element.status == 'Menunggu' &&
                            DateTimeFormatter.dMMMMyyy(element.scheduleTime) ==
                                DateTimeFormatter.dMMMMyyy(DateTime.now().toString()) ||
                        element.status == 'Proses' &&
                            DateTimeFormatter.dMMMMyyy(element.scheduleTime) ==
                                DateTimeFormatter.dMMMMyyy(DateTime.now().toString()))
                    .length
                    .toString(),
              );
            default:
              return ClinicInformationCard(
                iconPath: MainService.clinicInformationData()[index]['iconPath'],
                title: MainService.clinicInformationData()[index]['title'],
                qty: MainService.clinicInformationData()[index]['qty'],
              );
          }
        },
      ),
    );
