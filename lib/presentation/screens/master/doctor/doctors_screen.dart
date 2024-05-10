import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/blocs/master/doctor/get_doctors_bloc/get_doctors_bloc.dart';
import 'package:flutter_clinic/presentation/extension/search_form.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/doctor_list.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/doctors_appbar.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/doctors_title.dart';

import '../../../blocs/auth/get_user/get_user_bloc.dart';

class DoctorsScreen extends StatefulWidget {
  static const routerName = 'doctors';
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  TextEditingController doctorSearchC = TextEditingController();
  ScrollController scrollC = ScrollController();
  bool isNext = false;

  @override
  void initState() {
    context.read<GetDoctorsBloc>().add(const GetDoctorsEvent.getFirst(name: ''));
    scrollC.addListener(() {
      if (scrollC.position.maxScrollExtent == scrollC.offset) {
        isNext = context.read<GetDoctorsBloc>().isNext;
        if (isNext) {
          context.read<GetDoctorsBloc>().add(GetDoctorsEvent.getNext(name: doctorSearchC.text));
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    doctorSearchC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<GetUserBloc>().state.whenOrNull(success: (user) => user);

    return Scaffold(
      appBar: doctorsAppbar(context: context, user: user),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: SearchForm(
              searchC: doctorSearchC,
              hintText: 'Ketik nama dokter...',
              label: 'Cari Dokter',
              debouncerFunc: () => context.read<GetDoctorsBloc>().add(
                    GetDoctorsEvent.getFirst(name: doctorSearchC.text),
                  ),
              suffixOnPressed: () => context.read<GetDoctorsBloc>().add(
                    GetDoctorsEvent.getFirst(name: doctorSearchC.text),
                  ),
              onSubmitted: (value) => context.read<GetDoctorsBloc>().add(
                    GetDoctorsEvent.getFirst(name: value),
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...doctorsTitle(),
                  doctorList(scrollC: scrollC, user: user, refreshIndicatorKey: refreshIndicatorKey),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
