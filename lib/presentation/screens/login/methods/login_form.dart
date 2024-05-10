import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_loading.dart';
import 'package:flutter_clinic/presentation/misc/clinic_color.dart';

import '../../../blocs/auth/login/login_bloc.dart';
import '../../../extension/clinic_alert.dart';
import '../../../extension/clinic_form.dart';
import '../../../misc/clinic_textstyle.dart';
import '../../../misc/spacing.dart';

Widget loginForm({
  required BuildContext context,
  required TextEditingController emailC,
  required TextEditingController passwordC,
  required bool isHidePassword,
  required VoidCallback onTapSuffix,
}) =>
    Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(MediaQuery.of(context).size.height / 4),
            Text(
              'Login',
              style: ClinicTextStyle.h1SemiBold(),
            ),
            verticalSpace(14),
            ClinicForm(
              controller: emailC,
              label: 'Email',
              hintText: 'Masukkan alamat email',
            ),
            verticalSpace(14),
            ClinicForm(
              controller: passwordC,
              obscureText: isHidePassword ? true : false,
              minLines: 1,
              maxLines: 1,
              suffixIcon: GestureDetector(
                onTap: onTapSuffix,
                child: Icon(
                  isHidePassword ? CupertinoIcons.eye_solid : CupertinoIcons.eye_slash_fill,
                  size: 24,
                  color: ClinicColor.black,
                ),
              ),
              label: 'Password',
              hintText: 'Masukkan password',
            ),
            verticalSpace(24),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => ElevatedButton(
                    onPressed: () {
                      if (emailC.text.isEmpty || passwordC.text.isEmpty) {
                        ClinicAlert.error(context: context, content: 'Email dan password harus diisi');
                      } else {
                        context.read<LoginBloc>().add(LoginEvent.doLogin(email: emailC.text, password: passwordC.text));
                      }
                    },
                    child: const Text(
                      'Login',
                    ),
                  ),
                  loading: () => ClinicLoading.buttonCircular(),
                );
              },
            )
          ],
        ),
      ),
    );
