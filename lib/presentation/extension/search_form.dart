// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';
import 'package:flutter_clinic/presentation/misc/clinic_textstyle.dart';

import '../misc/debouncer.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchForm extends StatelessWidget {
  final TextEditingController searchC;
  final String hintText;
  final String label;
  final VoidCallback debouncerFunc;
  final VoidCallback suffixOnPressed;
  final Function(String value) onSubmitted;
  const SearchForm({
    super.key,
    required this.searchC,
    required this.hintText,
    required this.label,
    required this.debouncerFunc,
    required this.suffixOnPressed,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final Debouncer debouncer = Debouncer(duration: const Duration(milliseconds: 800));

    return TextField(
      controller: searchC,
      onSubmitted: onSubmitted,
      onChanged: (value) {
        debouncer.run(debouncerFunc);
      },
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: suffixOnPressed,
          icon: Icon(
            Icons.search_rounded,
            size: 28,
            color: ClinicColor.primary,
          ),
        ),
        hintText: hintText,
        hintStyle: ClinicTextStyle.h5Regular(),
        label: Text(
          label,
          style: ClinicTextStyle.h5Regular(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: ClinicColor.border),
        ),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ClinicColor.border,
          ),
        ),
      ),
    );
  }
}
