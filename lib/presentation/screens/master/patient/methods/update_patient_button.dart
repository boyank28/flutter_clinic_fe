import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';

import '../../../../blocs/master/patient/update_patient_bloc/update_patient_bloc.dart';

Widget updatePatientButton({
  required VoidCallback onPressed,
}) =>
    Container(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<UpdatePatientBloc, UpdatePatientState>(
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
