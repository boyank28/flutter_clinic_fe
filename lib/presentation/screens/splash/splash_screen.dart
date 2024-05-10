// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clinic/data/datasources/auth/auth_local_datasource.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';
import 'package:flutter_clinic/presentation/screens/login/login_screen.dart';
import 'package:flutter_clinic/presentation/screens/main/main_screen.dart';
import 'package:flutter_clinic/presentation/screens/splash/methods/clinic_logo.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const routerName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    autoNavigate();
    super.initState();
  }

  autoNavigate() {
    return Timer(const Duration(seconds: 3), () async {
      String? token = await AuthLocalDatasource().getToken();

      if (token != null) {
        context.goNamed(MainScreen.routerName);
      } else {
        await AuthLocalDatasource().removeToken();
        await AuthLocalDatasource().removeAuthData();
        context.goNamed(LoginScreen.routerName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ClinicColor.darkBg,
      body: clinicLogo(context),
    );
  }
}
