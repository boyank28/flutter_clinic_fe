// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';

class ClinicInformationCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String qty;
  const ClinicInformationCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          width: 70,
          height: 105,
          decoration: BoxDecoration(
              color: ClinicColor.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              )),
          child: FadeInImage(
            placeholder: const AssetImage('assets/images/img_placeholder.png'),
            image: AssetImage(iconPath),
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 6,
          height: 105,
          decoration: BoxDecoration(
            color: ClinicColor.primary.withOpacity(.1),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: ClinicTextStyle.h5Medium(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    qty,
                    style: ClinicTextStyle.h4Bold().copyWith(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
