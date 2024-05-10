// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/add_medical_record_screen.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/detail_medical_record_screen.dart';

import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';
import '../misc/spacing.dart';

class PatientReservationCard extends StatelessWidget {
  final PatientReservation patientReservation;
  final Color statusColor;
  const PatientReservationCard({
    super.key,
    required this.patientReservation,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          switch (patientReservation.status) {
            case 'Menunggu':
              context.pushNamed(
                AddMedicalRecordScreen.routerName,
                extra: patientReservation,
              );
              break;
            case 'Proses':
              context.goNamed(
                DetailMedicalRecordScreen.routerName,
                queryParameters: {
                  'reservationId': patientReservation.id.toString(),
                },
              );
            case 'Selesai':
              context.goNamed(
                DetailMedicalRecordScreen.routerName,
                queryParameters: {
                  'reservationId': patientReservation.id.toString(),
                },
              );
            case 'Batal':
              context.goNamed(
                AddMedicalRecordScreen.routerName,
                extra: patientReservation,
              );
          }
        },
        splashColor: statusColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 125,
              decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Antrian',
                    style: ClinicTextStyle.h5Regular().copyWith(
                        color: patientReservation.status == 'Menunggu' ? ClinicColor.black : ClinicColor.white),
                  ),
                  Text(
                    patientReservation.queueNumber.toString(),
                    style: ClinicTextStyle.h2Bold().copyWith(
                        color: patientReservation.status == 'Menunggu' ? ClinicColor.black : ClinicColor.white),
                  ),
                ],
              ),
            ),
            horizontalSpaces(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${patientReservation.patient.name} (${patientReservation.patient.gender})',
                    style: ClinicTextStyle.h4SemiBold(),
                  ),
                  verticalSpace(4),
                  Text(
                    'NIK : ${patientReservation.patient.nik}',
                    style: ClinicTextStyle.h5Regular(),
                  ),
                  verticalSpace(4),
                  Text(
                    'Keluhan : ${patientReservation.complaint}',
                    style: ClinicTextStyle.h5Regular(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Text(
                    'Ditangani Oleh : ${patientReservation.doctor.name}, ${patientReservation.doctor.specialization}',
                    style: ClinicTextStyle.h5Regular().copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
