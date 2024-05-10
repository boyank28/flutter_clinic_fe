// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../misc/clinic_textstyle.dart';
import '../misc/spacing.dart';

class ReservationStatus extends StatelessWidget {
  final String label;
  final Color color;
  const ReservationStatus({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        horizontalSpaces(7),
        Text(
          label,
          style: ClinicTextStyle.h4Regular(),
        ),
        horizontalSpaces(24),
      ],
    );
  }
}
