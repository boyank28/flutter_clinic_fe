import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/master/clinic_service/update_clinic_service_bloc/update_clinic_service_bloc.dart';
import '../../../../extension/clinic_loading.dart';

Widget editServiceButton({
  required VoidCallback onPressed,
}) =>
    BlocBuilder<UpdateClinicServiceBloc, UpdateClinicServiceState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => ElevatedButton(
            onPressed: onPressed,
            child: const Text('Simpan'),
          ),
          loading: () => ClinicLoading.buttonCircular(),
        );
      },
    );
