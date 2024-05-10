// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';

class BankCard extends StatelessWidget {
  final String? imagePath;
  final String label;
  final VoidCallback onTap;
  final bool hasLogo;
  const BankCard({
    super.key,
    this.imagePath,
    required this.label,
    required this.onTap,
    this.hasLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: ClinicColor.primary.withOpacity(.3),
        ),
      ),
      splashColor: ClinicColor.primary.withOpacity(.2),
      title: Row(
        children: [
          if (hasLogo && imagePath != null)
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: FadeInImage(
                alignment: Alignment.centerLeft,
                placeholder: const AssetImage('assets/images/img_placeholder.png'),
                image: AssetImage(imagePath!),
                fit: BoxFit.fitHeight,
                height: 20,
                fadeInDuration: const Duration(milliseconds: 300),
                fadeOutDuration: const Duration(milliseconds: 300),
              ),
            ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Text(
              label,
              style: ClinicTextStyle.h4Regular(),
            ),
          )
        ],
      ),
    );
  }
}
