import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';

import '../../../../blocs/master/doctor/create_doctor_bloc/create_doctor_bloc.dart';

Widget addDoctorButton({
  required VoidCallback onPressed,
}) =>
    Container(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<CreateDoctorBloc, CreateDoctorState>(
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
