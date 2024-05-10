import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/medical_record.dart';

import '../extension/datetime_formatter.dart';
import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';
import '../misc/spacing.dart';

class MedicalRecordCard extends StatelessWidget {
  final MedicalRecord medicalRecord;
  final VoidCallback onTap;
  const MedicalRecordCard({
    super.key,
    required this.medicalRecord,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: ClinicColor.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ClinicColor.primary.withOpacity(0.2))),
      child: InkWell(
        onTap: onTap,
        splashColor: ClinicColor.primary.withOpacity(.1),
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 125,
              decoration: BoxDecoration(
                color: ClinicColor.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                border: Border.all(
                  color: ClinicColor.primary.withOpacity(0.2),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateTimeFormatter.dMy(medicalRecord.createdAt),
                    style: ClinicTextStyle.h5Regular().copyWith(color: ClinicColor.white),
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
                    '${medicalRecord.patientReservation.patient.name} (${medicalRecord.patientReservation.patient.gender})',
                    style: ClinicTextStyle.h4SemiBold(),
                  ),
                  verticalSpace(4),
                  Text(
                    'Diagnosa : ${medicalRecord.diagnosis}',
                    style: ClinicTextStyle.h5Regular(),
                  ),
                  verticalSpace(4),
                  Text(
                    'Medical Treatment : ${medicalRecord.medicalTreatment}',
                    style: ClinicTextStyle.h5Regular(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Text(
                    'Ditangani Oleh : ${medicalRecord.patientReservation.doctor.name}, ${medicalRecord.patientReservation.doctor.specialization}',
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
