// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_clinic/data/datasources/master/doctor/doctor_external_datasource.dart';
import 'package:flutter_clinic/domain/entities/doctor.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/edit_doctor_screen.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/detail_doctor_dialog.dart';

import '../blocs/master/doctor/delete_doctor_bloc/delete_doctor_bloc.dart';
import '../blocs/master/doctor/get_doctors_bloc/get_doctors_bloc.dart';
import '../extension/clinic_alert.dart';
import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';
import '../misc/spacing.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final User? user;
  const DoctorCard({
    super.key,
    required this.doctor,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => detailDoctorDialog(
        context: context,
        doctor: doctor,
        user: user,
        onTapDelete: () {
          context.pop();
          confirmDeleteDialog(context);
        },
        onTapEdit: () {
          context.pop();
          context.goNamed(EditDoctorScreen.routerName, extra: doctor);
        },
      ),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: ClinicColor.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border(
            left: BorderSide(
              color: ClinicColor.primary,
              width: 12,
            ),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 80,
                height: 80,
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/img_placeholder.png'),
                  image: doctor.photo != null && doctor.photo!.contains('https')
                      ? NetworkImage(doctor.photo!)
                      : NetworkImage('http://www.laravel-clinic-be.test/storage/doctors/${doctor.photo}'),
                  imageErrorBuilder: (context, error, stackTrace) => Image.asset('assets/images/img_placeholder.png'),
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 250),
                  fadeOutDuration: const Duration(
                    milliseconds: 250,
                  ),
                ),
              ),
            ),
            horizontalSpaces(14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${doctor.name}, ${doctor.specialization}',
                  style: ClinicTextStyle.h4SemiBold(),
                ),
                verticalSpace(4),
                Text('NIK : ${doctor.nik}', style: ClinicTextStyle.h5Regular()),
                verticalSpace(4),
                Text('ID IHS : ${doctor.idIhs}', style: ClinicTextStyle.h5Regular()),
                verticalSpace(4),
                Text('SIP : ${doctor.sip}', style: ClinicTextStyle.h5Regular()),
              ],
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
        create: (context) => DeleteDoctorBloc(DoctorExternalDatasource()),
        child: BlocListener<DeleteDoctorBloc, DeleteDoctorState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (message) {
                ClinicAlert.successful(context: context, content: message);
                context.read<GetDoctorsBloc>().add(const GetDoctorsEvent.getFirst(name: ''));
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
              'Apakah anda yakin ingin menghapus ${doctor.name}, ${doctor.specialization}?',
              style: ClinicTextStyle.h4Regular(),
            ),
            actions: [
              BlocBuilder<DeleteDoctorBloc, DeleteDoctorState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => TextButton(
                      onPressed: () => context.read<DeleteDoctorBloc>().add(DeleteDoctorEvent.doDelete(id: doctor.id)),
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
