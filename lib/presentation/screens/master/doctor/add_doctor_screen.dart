import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/master/doctor/create_doctor_bloc/create_doctor_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/master/doctor/get_doctors_bloc/get_doctors_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/theme/toggle_theme_bloc/toggle_theme_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_alert.dart';
import 'package:flutter_clinic/presentation/misc/spacing.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/add_doctor_appbar.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/add_doctor_button.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/address_form.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/email_form.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/id_ihs_form.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/name_form.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/nik_form.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/phone_form.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/profile_photo_picker.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/sip_form.dart';
import 'package:flutter_clinic/presentation/screens/master/doctor/methods/specialization_form.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AddDoctorScreen extends StatefulWidget {
  static const routerName = 'add-doctor';
  const AddDoctorScreen({super.key});

  @override
  State<AddDoctorScreen> createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen> {
  TextEditingController sipC = TextEditingController();
  TextEditingController idIhsC = TextEditingController();
  TextEditingController nikC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController specializationC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  String? photoPath;

  @override
  void dispose() {
    sipC.dispose();
    idIhsC.dispose();
    nikC.dispose();
    nameC.dispose();
    specializationC.dispose();
    emailC.dispose();
    phoneC.dispose();
    addressC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData? theme = context.watch<ToggleThemeBloc>().state.whenOrNull(themeResult: (themeResult) => themeResult);

    return BlocListener<CreateDoctorBloc, CreateDoctorState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (doctor) {
            ClinicAlert.successful(
                context: context, content: 'Berhasil menambah dokter baru : ${doctor.name}, ${doctor.specialization}');
            context.pop();
            context.read<GetDoctorsBloc>().add(const GetDoctorsEvent.getFirst(name: ''));
          },
          failed: (message) {
            ClinicAlert.error(context: context, content: message);
          },
        );
      },
      child: Scaffold(
        appBar: addDoctorAppbar(context),
        bottomNavigationBar: addDoctorButton(
          onPressed: () {
            if (sipC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'SIP dokter tidak boleh kosong');
            } else if (nameC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'Nama dokter tidak boleh kosong');
            } else if (specializationC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'Spesialisasi dokter tidak boleh kosong');
            } else if (phoneC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'No Telepon dokter tidak boleh kosong');
            } else if (emailC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'Email dokter tidak boleh kosong');
            } else {
              context.read<CreateDoctorBloc>().add(
                    CreateDoctorEvent.doCreate(
                      name: nameC.text,
                      nik: nikC.text,
                      sip: sipC.text,
                      idIhs: idIhsC.text,
                      specialization: specializationC.text,
                      address: addressC.text,
                      email: emailC.text,
                      phone: phoneC.text,
                      photo: photoPath,
                    ),
                  );
            }
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              ...profilePhotoPicker(
                photoPath: photoPath,
                theme: theme,
                onTap: () async {
                  final ImagePicker imagePicker = ImagePicker();
                  var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
                  if (pickedImage == null) return;

                  setState(() {
                    photoPath = pickedImage.path;
                  });
                },
              ),
              ...nikForm(nikC: nikC),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        ...sipForm(sipC: sipC),
                      ],
                    ),
                  ),
                  horizontalSpaces(14),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        ...idIhsForm(idIhsC: idIhsC),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        ...nameForm(nameC: nameC),
                      ],
                    ),
                  ),
                  horizontalSpaces(14),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        ...specializationForm(specializationC: specializationC),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        ...phoneForm(phoneC: phoneC),
                      ],
                    ),
                  ),
                  horizontalSpaces(14),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        ...emailForm(emailC: emailC),
                      ],
                    ),
                  ),
                ],
              ),
              ...addressForm(addressC: addressC),
            ],
          ),
        ),
      ),
    );
  }
}
