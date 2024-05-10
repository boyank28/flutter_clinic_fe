import 'package:flutter/material.dart';

Widget clinicLogo(BuildContext context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInImage(
            placeholder: const AssetImage('assets/images/img_placeholder.png'),
            image: const AssetImage('assets/images/img_clinic_logo_white.png'),
            width: MediaQuery.of(context).size.height / 3,
            fit: BoxFit.fitWidth,
            fadeInDuration: const Duration(milliseconds: 250),
            fadeOutDuration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
