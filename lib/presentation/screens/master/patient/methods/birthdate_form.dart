import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../extension/clinic_form.dart';
import '../../../../misc/spacing.dart';

Widget birthDateForm({
  required BuildContext context,
  required TextEditingController birthDateC,
  required VoidCallback onPressed,
}) =>
    Flexible(
      flex: 1,
      child: Column(
        children: [
          ClinicForm(
            controller: birthDateC,
            label: 'Tanggal Lahir',
            hintText: 'Tanggal Lahir Pasien',
            keyboardType: TextInputType.number,
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(
                CupertinoIcons.calendar,
                color: Theme.of(context).colorScheme.onBackground,
                size: 24,
              ),
            ),
          ),
          verticalSpace(14),
        ],
      ),
    );
