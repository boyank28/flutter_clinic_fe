import 'package:flutter/material.dart';

import '../../../misc/clinic_color.dart';
import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';

Widget loginBanner(BuildContext context) => Flexible(
      flex: 1,
      fit: FlexFit.loose,
      child: Container(
        decoration: BoxDecoration(
          color: ClinicColor.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              verticalSpace(24),
              Image.asset(
                'assets/images/img_clinic_logo_white.png',
                width: 210,
                fit: BoxFit.fitWidth,
              ),
              Text(
                'Embark on efficiency with a single click, discover the seamless world of clinic management!',
                style: ClinicTextStyle.h3Medium().copyWith(color: ClinicColor.white),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Expanded(
                flex: 12,
                child: Image.asset(
                  'assets/images/img_doctor_bg.png',
                  width: MediaQuery.of(context).size.width / 2 - 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
