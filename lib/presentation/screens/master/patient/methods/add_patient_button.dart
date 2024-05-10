import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';

import '../../../../blocs/master/patient/create_patient_bloc/create_patient_bloc.dart';

Widget addPatientButton({
  required VoidCallback onPressed,
}) =>
    Container(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<CreatePatientBloc, CreatePatientState>(
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
