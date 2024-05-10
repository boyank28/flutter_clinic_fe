import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/theme/toggle_theme_bloc/toggle_theme_bloc.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/methods/back_button.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/methods/clinic_services.dart';
import 'package:flutter_clinic/presentation/screens/medical_record/methods/select_clinic_service_appbar.dart';

import '../../blocs/master/clinic_service/get_clinic_services_bloc/get_clinic_services_bloc.dart';
import '../../extension/search_form.dart';
import '../../misc/spacing.dart';

class SelectClinicServicesScreen extends StatefulWidget {
  static const routerName = 'select-clinic-services';
  const SelectClinicServicesScreen({super.key});

  @override
  State<SelectClinicServicesScreen> createState() => _SelectClinicServicesScreenState();
}

class _SelectClinicServicesScreenState extends State<SelectClinicServicesScreen> {
  TextEditingController searchC = TextEditingController();

  @override
  void initState() {
    context.read<GetClinicServicesBloc>().add(const GetClinicServicesEvent.getAll(name: ''));

    super.initState();
  }

  @override
  void dispose() {
    searchC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData? theme = context.watch<ToggleThemeBloc>().state.whenOrNull(themeResult: (themeResult) => themeResult);

    return Scaffold(
      appBar: selectClinicServiceAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SearchForm(
              searchC: searchC,
              hintText: 'Ketik nama layanan',
              label: 'Cari Layanan',
              debouncerFunc: () => context
                  .read<GetClinicServicesBloc>()
                  .add(GetClinicServicesEvent.getAll(name: searchC.text.isEmpty ? '' : searchC.text)),
              suffixOnPressed: () => context
                  .read<GetClinicServicesBloc>()
                  .add(GetClinicServicesEvent.getAll(name: searchC.text.isEmpty ? '' : searchC.text)),
              onSubmitted: (value) =>
                  context.read<GetClinicServicesBloc>().add(GetClinicServicesEvent.getAll(name: value)),
            ),
            verticalSpace(14),
            clinicServices(theme: theme),
            verticalSpace(14),
            backButton(context),
          ],
        ),
      ),
    );
  }
}
