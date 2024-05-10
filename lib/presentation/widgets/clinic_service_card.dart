// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_clinic/domain/entities/clinic_service.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/edit_clinic_service_screen.dart';

import '../../data/datasources/master/clinic_service/clinic_service_external_datasource.dart';
import '../blocs/master/clinic_service/delete_clinic_service_bloc/delete_clinic_service_bloc.dart';
import '../blocs/master/clinic_service/get_clinic_services_bloc/get_clinic_services_bloc.dart';
import '../extension/clinic_alert.dart';
import '../extension/clinic_loading.dart';
import '../extension/rupiah_formatter.dart';
import '../misc/clinic_color.dart';
import '../misc/clinic_textstyle.dart';
import '../misc/spacing.dart';
import '../screens/master/clinic_service/methods/detail_clinic_service_dialog.dart';

class ClinicServiceCard extends StatelessWidget {
  final ClinicService service;
  final User? user;
  const ClinicServiceCard({
    super.key,
    required this.service,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => detailClinicServiceDialog(
        context: context,
        service: service,
        user: user,
        onTapEdit: () {
          context.goNamed(
            EditClinicServiceScreen.routerName,
            extra: service,
          );
          context.pop();
        },
        onTapDelete: () {
          context.pop();
          confirmDeleteDialog(context);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.name,
              style: ClinicTextStyle.h4SemiBold(),
            ),
            verticalSpace(7),
            Text(
              'Harga : ${rupiahFormatter(service.price.toString())}',
              style: ClinicTextStyle.h5Medium(),
            ),
            verticalSpace(7),
            Text(
              'Qty : ${service.qty}',
              style: ClinicTextStyle.h5Medium(),
            ),
            Text(
              'Kategori : ${service.category}',
              style: ClinicTextStyle.h5Medium(),
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
        create: (context) => DeleteClinicServiceBloc(ClinicServiceExternalDatasource()),
        child: BlocListener<DeleteClinicServiceBloc, DeleteClinicServiceState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (message) {
                ClinicAlert.successful(context: context, content: message);
                context.read<GetClinicServicesBloc>().add(const GetClinicServicesEvent.getAll(name: ''));
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
              'Apakah anda yakin ingin menghapus ${service.name}?',
              style: ClinicTextStyle.h4Regular(),
            ),
            actions: [
              BlocBuilder<DeleteClinicServiceBloc, DeleteClinicServiceState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => TextButton(
                      onPressed: () => context
                          .read<DeleteClinicServiceBloc>()
                          .add(DeleteClinicServiceEvent.deleteById(id: service.id)),
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
