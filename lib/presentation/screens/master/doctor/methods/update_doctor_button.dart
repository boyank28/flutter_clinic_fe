import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';

import '../../../../blocs/master/doctor/update_doctor/update_doctor_bloc.dart';

Widget updateDoctorButton({
  required VoidCallback onPressed,
}) =>
    Container(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<UpdateDoctorBloc, UpdateDoctorState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => ElevatedButton(
              onPressed: onPressed,
              child: const Text('Update'),
            ),
            loading: () => ClinicLoading.buttonCircular(),
          );
        },
      ),
    );