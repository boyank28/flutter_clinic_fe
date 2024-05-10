// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';
import '../misc/spacing.dart';

class EmptyData extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  const EmptyData({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: ClinicTextStyle.h4Regular(),
          ),
          verticalSpace(20),
          TextButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.refresh,
                  color: ClinicColor.primary,
                ),
                horizontalSpaces(14),
                const Text('Reload'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
