import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/blocs/patient_reservation/get_patient_reservations_bloc/get_patient_reservations_bloc.dart';
import 'package:flutter_clinic/presentation/screens/patient_reservation/methods/patient_reservation_list.dart';
import 'package:flutter_clinic/presentation/screens/patient_reservation/methods/patient_reservations_appbar.dart';
import 'package:flutter_clinic/presentation/screens/patient_reservation/methods/patient_search.dart';

import '../../blocs/auth/get_user/get_user_bloc.dart';
import '../../blocs/master/patient/get_patients_bloc/get_patients_bloc.dart';

class PatientReservationsScreen extends StatefulWidget {
  static const routerName = 'patient-reservations';
  const PatientReservationsScreen({super.key});

  @override
  State<PatientReservationsScreen> createState() => _PatientReservationsScreenState();
}

class _PatientReservationsScreenState extends State<PatientReservationsScreen> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  TextEditingController reservationSearchC = TextEditingController();
  TextEditingController patientSearchC = TextEditingController();
  ScrollController scrollC = ScrollController();
  bool isNext = false;

  @override
  void initState() {
    context.read<GetPatientReservationsBloc>().add(const GetPatientReservationsEvent.doGet(patient: ''));
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
  void dispose() {
    reservationSearchC.dispose();
    patientSearchC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<GetUserBloc>().state.whenOrNull(success: (user) => user);

    return Scaffold(
      appBar: patientReservationsAppbar(),
      body: Column(
        children: [
          patientSearch(
            context: context,
            reservationSearchC: reservationSearchC,
            patientSearchC: patientSearchC,
            scrollC: scrollC,
            user: user,
          ),
          patientReservationList(
            context: context,
            refreshIndicatorKey: refreshIndicatorKey,
          ),
        ],
      ),
    );
  }
}
