// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_clinic/domain/entities/doctor_schedule.dart';

import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';

class DoctorScheduleCard extends StatelessWidget {
  final DoctorSchedule schedule;
  const DoctorScheduleCard({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: schedule.status == 'Tidak Aktif'
                ? ClinicColor.danger.withOpacity(.03)
                : ClinicColor.success.withOpacity(0.03),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: schedule.status == 'Tidak Aktif' ? ClinicColor.danger : ClinicColor.success)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${schedule.doctor.name}, ${schedule.doctor.specialization}',
              style: ClinicTextStyle.h5SemiBold()
                  .copyWith(color: schedule.status == 'Tidak Aktif' ? ClinicColor.danger : ClinicColor.success),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${schedule.start} - ${schedule.end}',
              style: ClinicTextStyle.h5Medium()
                  .copyWith(color: schedule.status == 'Tidak Aktif' ? ClinicColor.danger : ClinicColor.success),
            ),
            Text(
              schedule.note ?? '-',
              style: ClinicTextStyle.h5Medium()
                  .copyWith(color: schedule.status == 'Tidak Aktif' ? ClinicColor.danger : ClinicColor.success),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
