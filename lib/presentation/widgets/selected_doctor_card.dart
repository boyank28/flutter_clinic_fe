// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_clinic/domain/entities/doctor.dart';

import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';
import '../misc/spacing.dart';

class SelectedDoctorCard extends StatelessWidget {
  final Doctor selectedDoctor;
  final VoidCallback onPressed;
  const SelectedDoctorCard({
    super.key,
    required this.selectedDoctor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 100,
            height: 100,
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/img_placeholder.png'),
              image: selectedDoctor.photo != null && selectedDoctor.photo!.contains('https')
                  ? NetworkImage(selectedDoctor.photo!)
                  : NetworkImage('http://www.laravel-clinic-be.test/storage/doctors/${selectedDoctor.photo}'),
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
              '${selectedDoctor.name}, ${selectedDoctor.specialization}',
              style: ClinicTextStyle.h4SemiBold(),
            ),
            verticalSpace(4),
            Text('NIK : ${selectedDoctor.nik}', style: ClinicTextStyle.h5Regular()),
            verticalSpace(4),
            Text('ID IHS : ${selectedDoctor.idIhs}', style: ClinicTextStyle.h5Regular()),
            verticalSpace(4),
            Text('SIP : ${selectedDoctor.sip}', style: ClinicTextStyle.h5Regular()),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: 160,
          height: 40,
          child: TextButton(
            onPressed: onPressed,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ubah Dokter',
                  style: ClinicTextStyle.h5SemiBold().copyWith(color: ClinicColor.primary),
                ),
                horizontalSpaces(7),
                Icon(
                  CupertinoIcons.arrow_down_square_fill,
                  size: 20,
                  color: ClinicColor.primary,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
