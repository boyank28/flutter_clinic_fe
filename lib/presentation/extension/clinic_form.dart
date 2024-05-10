// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_clinic/presentation/misc/clinic_color.dart';
import 'package:flutter_clinic/presentation/misc/clinic_textstyle.dart';

import '../misc/spacing.dart';

class ClinicForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? withLabel;
  final int? minLines;
  final int? maxLines;
  final bool? readOnly;
  final Color? textColor;
  final Function(String value)? onChanged;
  const ClinicForm({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.withLabel = true,
    this.minLines,
    this.maxLines,
    this.readOnly,
    this.textColor,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (withLabel == true)
          Text(
            label,
            style: ClinicTextStyle.h4Regular()
                .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
          ),
        if (withLabel == true) verticalSpace(7),
        SizedBox(
          height: minLines != null && maxLines != null ? null : 60,
          child: TextField(
            controller: controller,
            readOnly: readOnly ?? false,
            obscureText: obscureText ?? false,
            onChanged: onChanged,
            style: ClinicTextStyle.h4Regular().copyWith(color: textColor),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            keyboardType: keyboardType,
            minLines: minLines,
            maxLines: maxLines,
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: ClinicTextStyle.h4Regular(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ClinicColor.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ClinicColor.border,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: ClinicColor.border,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
