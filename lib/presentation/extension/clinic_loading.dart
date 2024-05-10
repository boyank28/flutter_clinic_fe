import 'package:flutter/material.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';
import 'package:flutter_clinic/presentation/misc/clinic_textstyle.dart';
import 'package:shimmer/shimmer.dart';
import '../misc/spacing.dart';

class ClinicLoading {
  static buttonCircular() => ElevatedButton(
        onPressed: () {},
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: ClinicColor.white,
          ),
        ),
      );

  static dropdown(BuildContext context) => Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          horizontalSpaces(14),
          Text(
            'Loading..',
            style: ClinicTextStyle.h4Regular(),
          )
        ],
      );

  static textButtonCircular() => TextButton(
        onPressed: () {},
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: ClinicColor.danger,
            strokeWidth: 2,
          ),
        ),
      );

  static shimmer(BuildContext context) => Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                splashColor: ClinicColor.primary.withOpacity(0.2),
                horizontalTitleGap: 7,
                titleAlignment: ListTileTitleAlignment.center,
                leading: SizedBox(
                  width: 20,
                  height: 20,
                  child: Shimmer.fromColors(
                    baseColor: ClinicColor.grey.withOpacity(0.2),
                    highlightColor: ClinicColor.border.withOpacity(0.1),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: ClinicColor.grey,
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: ClinicColor.grey.withOpacity(0.2),
                      highlightColor: ClinicColor.border.withOpacity(0.1),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 18,
                        decoration: BoxDecoration(
                          color: ClinicColor.grey,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Shimmer.fromColors(
                      baseColor: ClinicColor.grey.withOpacity(0.2),
                      highlightColor: ClinicColor.border.withOpacity(0.1),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 18,
                        decoration: BoxDecoration(
                          color: ClinicColor.grey,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Shimmer.fromColors(
                      baseColor: ClinicColor.grey.withOpacity(0.2),
                      highlightColor: ClinicColor.border.withOpacity(0.1),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 18,
                        decoration: BoxDecoration(
                          color: ClinicColor.grey,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: Shimmer.fromColors(
                  baseColor: ClinicColor.grey.withOpacity(0.2),
                  highlightColor: ClinicColor.border.withOpacity(0.1),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: ClinicColor.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              verticalSpace(14),
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                splashColor: ClinicColor.primary.withOpacity(0.2),
                horizontalTitleGap: 7,
                titleAlignment: ListTileTitleAlignment.center,
                leading: SizedBox(
                  width: 20,
                  height: 20,
                  child: Shimmer.fromColors(
                    baseColor: ClinicColor.grey.withOpacity(0.2),
                    highlightColor: ClinicColor.border.withOpacity(0.1),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: ClinicColor.grey,
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: ClinicColor.grey.withOpacity(0.2),
                      highlightColor: ClinicColor.border.withOpacity(0.1),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 18,
                        decoration: BoxDecoration(
                          color: ClinicColor.grey,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Shimmer.fromColors(
                      baseColor: ClinicColor.grey.withOpacity(0.2),
                      highlightColor: ClinicColor.border.withOpacity(0.1),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 18,
                        decoration: BoxDecoration(
                          color: ClinicColor.grey,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Shimmer.fromColors(
                      baseColor: ClinicColor.grey.withOpacity(0.2),
                      highlightColor: ClinicColor.border.withOpacity(0.1),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 18,
                        decoration: BoxDecoration(
                          color: ClinicColor.grey,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: Shimmer.fromColors(
                  baseColor: ClinicColor.grey.withOpacity(0.2),
                  highlightColor: ClinicColor.border.withOpacity(0.1),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: ClinicColor.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              verticalSpace(14),
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                splashColor: ClinicColor.primary.withOpacity(0.2),
                horizontalTitleGap: 7,
                titleAlignment: ListTileTitleAlignment.center,
                leading: SizedBox(
                  width: 20,
                  height: 20,
                  child: Shimmer.fromColors(
                    baseColor: ClinicColor.grey.withOpacity(0.2),
                    highlightColor: ClinicColor.border.withOpacity(0.1),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: ClinicColor.grey,
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: ClinicColor.grey.withOpacity(0.2),
                      highlightColor: ClinicColor.border.withOpacity(0.1),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 18,
                        decoration: BoxDecoration(
                          color: ClinicColor.grey,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Shimmer.fromColors(
                      baseColor: ClinicColor.grey.withOpacity(0.2),
                      highlightColor: ClinicColor.border.withOpacity(0.1),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 18,
                        decoration: BoxDecoration(
                          color: ClinicColor.grey,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Shimmer.fromColors(
                      baseColor: ClinicColor.grey.withOpacity(0.2),
                      highlightColor: ClinicColor.border.withOpacity(0.1),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 18,
                        decoration: BoxDecoration(
                          color: ClinicColor.grey,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: Shimmer.fromColors(
                  baseColor: ClinicColor.grey.withOpacity(0.2),
                  highlightColor: ClinicColor.border.withOpacity(0.1),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: ClinicColor.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(14),
        ],
      );

  static Widget loadData(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ClinicColor.primary,
                      strokeWidth: 2,
                    )),
                const SizedBox(width: 7),
                Text(
                  'Sedang memuat data..',
                  style: ClinicTextStyle.h5Regular().copyWith(color: ClinicColor.primary),
                ),
              ],
            )
          ],
        ),
      );

  static Widget noDataMore(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Tidak ada data lagi',
            style: ClinicTextStyle.h5Regular().copyWith(color: ClinicColor.grey),
          ),
        ]),
      );
}
