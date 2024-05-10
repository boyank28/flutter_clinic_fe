// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_clinic/domain/entities/patient.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/edit_patient_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/detail_patient_dialog.dart';
import 'package:flutter_clinic/presentation/screens/patient_reservation/add_patient_reservation_screen.dart';

import '../../data/datasources/master/patient/patient_external_datasource.dart';
import '../blocs/master/patient/delete_patient_bloc/delete_patient_bloc.dart';
import '../blocs/master/patient/get_patients_bloc/get_patients_bloc.dart';
import '../blocs/theme/toggle_theme_bloc/toggle_theme_bloc.dart';
import '../extension/clinic_alert.dart';
import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';
import '../misc/spacing.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final User? user;
  const PatientCard({
    super.key,
    required this.patient,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData? theme = context.watch<ToggleThemeBloc>().state.whenOrNull(themeResult: (themeResult) => themeResult);

    return InkWell(
      onTap: () => detailPatientDialog(
        context: context,
        patient: patient,
        canEdit: false,
        user: user,
        theme: theme,
        onTapReservation: () {
          context.pop();
          context.pop();
          context.pushNamed(AddPatientReservationScreen.routerName, extra: patient);
        },
        onTapEdit: () {
          context.pop();
          context.pushNamed(EditPatientScreen.routerName, extra: patient);
        },
      ),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: patient.isDeceased == 1 ? ClinicColor.danger.withOpacity(0.1) : ClinicColor.success.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border(
            left: BorderSide(
              color: patient.isDeceased == 1 ? ClinicColor.danger : ClinicColor.success,
              width: 12,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${patient.name} (${patient.gender})',
                  style: ClinicTextStyle.h4SemiBold(),
                ),
                verticalSpace(4),
                Text('NIK : ${patient.nik}', style: ClinicTextStyle.h5Regular()),
                verticalSpace(4),
                Text('No KK : ${patient.noKk}', style: ClinicTextStyle.h5Regular()),
                verticalSpace(4),
                Text('No Telepon : ${patient.phone}', style: ClinicTextStyle.h5Regular()),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              decoration: BoxDecoration(
                  color: patient.isDeceased == 1 ? ClinicColor.danger : ClinicColor.success,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                patient.isDeceased == 1 ? 'Meninggal' : 'Hidup',
                style: ClinicTextStyle.h5SemiBold().copyWith(
                  color: ClinicColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> confirmDeleteDialog(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => BlocProvider(
        create: (context) => DeletePatientBloc(PatientExternalDatasource()),
        child: BlocListener<DeletePatientBloc, DeletePatientState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (message) {
                ClinicAlert.successful(context: context, content: message);
                context.read<GetPatientsBloc>().add(const GetPatientsEvent.getFirst(patient: ''));
                context.pop();
              },
              failed: (message) {
                ClinicAlert.error(context: context, content: message);
              },
            );
          },
          child: AlertDialog.adaptive(
            title: Text(
              'Konfirmasi',
              style: ClinicTextStyle.h3SemiBold(),
            ),
            content: Text(
              'Apakah anda yakin ingin menghapus ${patient.name}?',
              style: ClinicTextStyle.h4Regular(),
            ),
            actions: [
              BlocBuilder<DeletePatientBloc, DeletePatientState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => TextButton(
                      onPressed: () =>
                          context.read<DeletePatientBloc>().add(DeletePatientEvent.deleteById(id: patient.id)),
                      child: Text(
                        'Oke',
                        style: ClinicTextStyle.h5SemiBold().copyWith(color: ClinicColor.danger),
                      ),
                    ),
                    loading: () => ClinicLoading.textButtonCircular(),
                  );
                },
              ),
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Batal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
