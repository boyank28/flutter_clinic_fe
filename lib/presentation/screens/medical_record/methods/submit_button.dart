import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/patient_reservation.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';

import '../../../blocs/medical_record/create_medical_record_bloc/create_medical_record_bloc.dart';
import '../../../misc/spacing.dart';

List<Widget> submitButton({
  required PatientReservation patientReservation,
  required VoidCallback onPressed,
}) =>
    [
      if (patientReservation.status == 'Menunggu')
        BlocBuilder<CreateMedicalRecordBloc, CreateMedicalRecordState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => ElevatedButton(
                onPressed: onPressed,
                child: const Text('Simpan Medical Record'),
              ),
              loading: () => ClinicLoading.buttonCircular(),
            );
          },
        ),
      verticalSpace(14),
    ];
