// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_clinic/domain/entities/doctor.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';

import '../misc/clinic_textstyle.dart';
import '../misc/spacing.dart';

class DoctorReservationcard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onTap;
  const DoctorReservationcard({
    super.key,
    required this.doctor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: ClinicColor.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(
            color: ClinicColor.primary,
            width: 12,
          ),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 80,
                height: 80,
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/img_placeholder.png'),
                  image: doctor.photo != null && doctor.photo!.contains('https')
                      ? NetworkImage(doctor.photo!)
                      : NetworkImage('http://www.laravel-clinic-be.test/storage/doctors/${doctor.photo}'),
                  imageErrorBuilder: (context, error, stackTrace) => Image.asset('assets/images/img_placeholder.png'),
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 250),
                  fadeOutDuration: const Duration(
                    milliseconds: 250,
                  ),
                ),
              ),
            ),
            horizontalSpaces(14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${doctor.name}, ${doctor.specialization}',
                  style: ClinicTextStyle.h4SemiBold(),
                ),
                verticalSpace(4),
                Text('NIK : ${doctor.nik}', style: ClinicTextStyle.h5Regular()),
                verticalSpace(4),
                Text('ID IHS : ${doctor.idIhs}', style: ClinicTextStyle.h5Regular()),
                verticalSpace(4),
                Text('SIP : ${doctor.sip}', style: ClinicTextStyle.h5Regular()),
              ],
            ),
            const Spacer(),
            Icon(
              CupertinoIcons.plus_rectangle_fill_on_rectangle_fill,
              color: ClinicColor.primary,
              size: 30,
            ),
            horizontalSpaces(14),
          ],
        ),
      ),
    );
  }
}
