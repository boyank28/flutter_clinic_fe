import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/blocs/master/patient/get_patients_bloc/get_patients_bloc.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/patient_list.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/patients_appbar.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/patients_title.dart';

import '../../../blocs/auth/get_user/get_user_bloc.dart';
import '../../../extension/search_form.dart';

class PatientsScreen extends StatefulWidget {
  static const routerName = 'patients';
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  TextEditingController patientSearchC = TextEditingController();
  ScrollController scrollC = ScrollController();
  bool isNext = false;

  @override
  void initState() {
    context.read<GetPatientsBloc>().add(const GetPatientsEvent.getFirst(patient: ''));
    scrollC.addListener(() {
      if (scrollC.position.maxScrollExtent == scrollC.offset) {
        isNext = context.read<GetPatientsBloc>().isNext;
        if (isNext) {
          context.read<GetPatientsBloc>().add(GetPatientsEvent.getNext(patient: patientSearchC.text));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<GetUserBloc>().state.whenOrNull(success: (user) => user);

    return Scaffold(
      appBar: patientsAppbar(
        context: context,
        user: user,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: SearchForm(
              searchC: patientSearchC,
              hintText: 'Ketik nama atau NIK pasien...',
              label: 'Cari Pasien',
              debouncerFunc: () => context.read<GetPatientsBloc>().add(
                    GetPatientsEvent.getFirst(patient: patientSearchC.text),
                  ),
              suffixOnPressed: () => context.read<GetPatientsBloc>().add(
                    GetPatientsEvent.getFirst(patient: patientSearchC.text),
                  ),
              onSubmitted: (value) => context.read<GetPatientsBloc>().add(
                    GetPatientsEvent.getFirst(patient: value),
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...patientsTitle(),
                  patientList(
                    scrollC: scrollC,
                    user: user,
                    refreshIndicatorKey: refreshIndicatorKey,
                  ),
                  // doctorList(scrollC: scrollC),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
