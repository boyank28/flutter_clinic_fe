// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_clinic/presentation/misc/spacing.dart';

import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';

class MenuCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;
  const MenuCard({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: ClinicColor.primary.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: ClinicColor.primary),
          color: ClinicColor.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage(
              placeholder: const AssetImage('assets/images/img_placeholder.png'),
              image: AssetImage(iconPath),
              fit: BoxFit.cover,
              height: 50,
              fadeInDuration: const Duration(milliseconds: 300),
              fadeOutDuration: const Duration(milliseconds: 300),
            ),
            verticalSpace(10),
            Text(
              label,
              style: ClinicTextStyle.h5Bold(),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
