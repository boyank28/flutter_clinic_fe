import 'package:flutter/material.dart';
import 'package:flutter_clinic/domain/entities/doctor_schedule.dart';

import '../../../../misc/clinic_color.dart';
import '../../../../misc/clinic_textstyle.dart';
import '../../../../widgets/doctor_schedule_card.dart';

Widget scheduleDatatable({
  required BuildContext context,
  required int maxScedulePerDay,
  required int sundaySceduleLength,
  required int mondaySceduleLength,
  required int tuesdaySceduleLength,
  required int wednesdaySceduleLength,
  required int thursdaySceduleLength,
  required int fridaySceduleLength,
  required int saturdaySceduleLength,
  required List<DoctorSchedule> sundayScedule,
  required List<DoctorSchedule> mondayScedule,
  required List<DoctorSchedule> tuesdayScedule,
  required List<DoctorSchedule> wednesdayScedule,
  required List<DoctorSchedule> thursdayScedule,
  required List<DoctorSchedule> fridayScedule,
  required List<DoctorSchedule> saturdayScedule,
}) =>
    DataTable(
      border: TableBorder(
          borderRadius: BorderRadius.circular(12),
          horizontalInside: BorderSide(
            color: ClinicColor.border,
          ),
          verticalInside: BorderSide(
            color: ClinicColor.border,
          ),
          top: BorderSide(
            color: ClinicColor.border,
          ),
          bottom: BorderSide(
            color: ClinicColor.border,
          ),
          left: BorderSide(
            color: ClinicColor.border,
          ),
          right: BorderSide(
            color: ClinicColor.border,
          )),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      dataRowMinHeight: 130,
      dataRowMaxHeight: double.infinity,
      columnSpacing: 20,
      horizontalMargin: 20,
      columns: ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu']
          .map(
            (e) => DataColumn(
              label: SizedBox(
                width: MediaQuery.of(context).size.width / 7 - 40,
                child: Center(
                  child: Text(
                    e,
                    style: ClinicTextStyle.h4SemiBold(),
                  ),
                ),
              ),
            ),
          )
          .toList(),
      rows: List.generate(
        maxScedulePerDay,
        (index) => DataRow(
          cells: [
            DataCell(
              index < sundaySceduleLength
                  ? DoctorScheduleCard(
                      schedule: sundayScedule[index],
                    )
                  : const SizedBox(),
            ),
            DataCell(
              index < mondaySceduleLength
                  ? DoctorScheduleCard(
                      schedule: mondayScedule[index],
                    )
                  : const SizedBox(),
            ),
            DataCell(
              index < tuesdaySceduleLength
                  ? DoctorScheduleCard(
                      schedule: tuesdayScedule[index],
                    )
                  : const SizedBox(),
            ),
            DataCell(
              index < wednesdaySceduleLength
                  ? DoctorScheduleCard(
                      schedule: wednesdayScedule[index],
                    )
                  : const SizedBox(),
            ),
            DataCell(
              index < thursdaySceduleLength
                  ? DoctorScheduleCard(
                      schedule: thursdayScedule[index],
                    )
                  : const SizedBox(),
            ),
            DataCell(
              index < fridaySceduleLength
                  ? DoctorScheduleCard(
                      schedule: fridayScedule[index],
                    )
                  : const SizedBox(),
            ),
            DataCell(
              index < saturdaySceduleLength
                  ? DoctorScheduleCard(
                      schedule: saturdayScedule[index],
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
