import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_alert.dart';
import 'package:flutter_clinic/presentation/screens/login/methods/login_banner.dart';
import 'package:flutter_clinic/presentation/screens/login/methods/login_form.dart';
import 'package:flutter_clinic/presentation/screens/main/main_screen.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/auth/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routerName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool isHidePassword = true;

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (user) {
            ClinicAlert.successful(context: context, content: 'Berhasil Login..');
            context.goNamed(MainScreen.routerName);
          },
          failed: (message) {
            ClinicAlert.error(context: context, content: message);
          },
        );
      },
      child: Center(
        child: Row(
          children: [
            loginBanner(context),
            loginForm(
              context: context,
              emailC: emailC,
              passwordC: passwordC,
              isHidePassword: isHidePassword,
              onTapSuffix: () {
                setState(() {
                  isHidePassword = !isHidePassword;
                });
              },
            ),
          ],
        ),
      ),
    ));
  }
}
