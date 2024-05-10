import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';

import '../../../blocs/patient_reservation/create_patient_reservation_bloc/create_patient_reservation_bloc.dart';

Widget addPatientReservationButton({
  required VoidCallback onPressed,
}) =>
    Container(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<CreatePatientReservationBloc, CreatePatientReservationState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => ElevatedButton(
              onPressed: onPressed,
              child: const Text('Simpan'),
            ),
            loading: () => ClinicLoading.buttonCircular(),
          );
        },
      ),
    );
