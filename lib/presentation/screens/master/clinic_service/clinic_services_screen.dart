import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:flutter_clinic/presentation/blocs/master/clinic_service/get_clinic_services_bloc/get_clinic_services_bloc.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/methods/clinic_services_appbar.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/methods/services_tab_bar.dart';

import '../../../blocs/auth/get_user/get_user_bloc.dart';

class ClinicServicesScreen extends StatefulWidget {
  static const routerName = 'clinic-service';
  const ClinicServicesScreen({super.key});

  @override
  State<ClinicServicesScreen> createState() => _ClinicServicesScreenState();
}

class _ClinicServicesScreenState extends State<ClinicServicesScreen> with TickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  TabController? _tabController;
  int? tabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController?.addListener(() {
      setState(() {
        tabIndex = _tabController?.index;
      });
    });

    context.read<GetClinicServicesBloc>().add(const GetClinicServicesEvent.getAll(name: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<GetUserBloc>().state.whenOrNull(success: (user) => user);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: clinicServicesAppbar(
          context: context,
          tabController: _tabController,
          user: user,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: servicesTabBar(
            tabController: _tabController,
            user: user,
            refreshIndicatorKey: refreshIndicatorKey,
          ),
        ),
      ),
    );
  }
}
