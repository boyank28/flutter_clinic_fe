import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/master/clinic_service/create_clinic_service_bloc/create_clinic_service_bloc.dart';
import '../../../../extension/clinic_loading.dart';

Widget addServiceButton({
  required VoidCallback onPressed,
}) =>
    BlocBuilder<CreateClinicServiceBloc, CreateClinicServiceState>(
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
