// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/domain/entities/satu_sehat/region.dart';
import 'package:flutter_clinic/presentation/blocs/satu_sehat/ss_get_provinces_bloc/ss_get_provinces_bloc.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/edit_patient_appbar.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/select_is_deceased.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/update_patient_button.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_clinic/domain/entities/patient.dart';
import 'package:flutter_clinic/presentation/misc/spacing.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/address_line_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/birthdate_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/birthplace_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/email_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/name_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/nik_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/no_kk_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/phone_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/postal_code_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/relationship_name_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/relationship_phone_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/rt_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/rw_form.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/select_city.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/select_district.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/select_gender.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/select_marital_status.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/select_province.dart';
import 'package:flutter_clinic/presentation/screens/master/patient/methods/select_sub_district.dart';

import '../../../blocs/master/patient/get_patients_bloc/get_patients_bloc.dart';
import '../../../blocs/master/patient/update_patient_bloc/update_patient_bloc.dart';
import '../../../blocs/satu_sehat/ss_get_cities_bloc/ss_get_cities_bloc.dart';
import '../../../blocs/satu_sehat/ss_get_districts_bloc/ss_get_districts_bloc.dart';
import '../../../blocs/satu_sehat/ss_get_sub_districts_bloc/ss_get_sub_districts_bloc.dart';
import '../../../extension/clinic_alert.dart';

class EditPatientScreen extends StatefulWidget {
  static const routerName = 'edit-patient';
  final Patient patient;
  const EditPatientScreen({
    super.key,
    required this.patient,
  });

  @override
  State<EditPatientScreen> createState() => _EditPatientScreenState();
}

class _EditPatientScreenState extends State<EditPatientScreen> {
  TextEditingController nikC = TextEditingController();
  TextEditingController noKKC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController birthPlaceC = TextEditingController();
  TextEditingController birthDateC = TextEditingController();
  TextEditingController addressLineC = TextEditingController();
  TextEditingController rtC = TextEditingController();
  TextEditingController rwC = TextEditingController();
  TextEditingController postalCodeC = TextEditingController();
  TextEditingController relationshipNameC = TextEditingController();
  TextEditingController relationshipPhoneC = TextEditingController();
  List<String> genders = [
    'Pilih Jenis Kelamin',
    'Pria',
    'Wanita',
  ];

  List<String> isDeceased = [
    'Pilih Status',
    'Hidup',
    'Meninggal',
  ];

  List<String> maritalStatuses = [
    'Pilih Status Perkawinan',
    'Belum Menikah',
    'Menikah',
    'Cerai',
  ];

  String? selectedGender;
  Region? selectedProvince;
  Region? selectedCity;
  Region? selectedDistrict;
  Region? selectedSubdistrict;
  String? selectedMaritalStatus;
  int? selectedIsDeceased;

  @override
  void initState() {
    nikC.text = widget.patient.nik;
    noKKC.text = widget.patient.noKk;
    nameC.text = widget.patient.name;
    phoneC.text = widget.patient.phone;
    emailC.text = widget.patient.email ?? '';
    birthPlaceC.text = widget.patient.birthPlace;
    birthDateC.text = widget.patient.birthDate.toString().substring(0, 10);
    addressLineC.text = widget.patient.addressLine;
    rtC.text = widget.patient.rt;
    rwC.text = widget.patient.rw;
    postalCodeC.text = widget.patient.postalCode;
    relationshipNameC.text = widget.patient.relationshipName ?? '';
    relationshipPhoneC.text = widget.patient.relationshipPhone ?? '';
    selectedGender = widget.patient.gender;
    selectedMaritalStatus = widget.patient.maritalStatus;
    selectedIsDeceased = widget.patient.isDeceased;
    selectedProvince = Region(
      code: widget.patient.provinceCode,
      parentCode: widget.patient.provinceCode,
      bpsCode: widget.patient.provinceCode,
      name: widget.patient.province,
    );

    selectedCity = Region(
      code: widget.patient.cityCode,
      parentCode: widget.patient.cityCode,
      bpsCode: widget.patient.cityCode,
      name: widget.patient.city,
    );

    selectedDistrict = Region(
      code: widget.patient.districtCode,
      parentCode: widget.patient.districtCode,
      bpsCode: widget.patient.districtCode,
      name: widget.patient.district,
    );

    selectedSubdistrict = Region(
      code: widget.patient.villageCode,
      parentCode: widget.patient.villageCode,
      bpsCode: widget.patient.villageCode,
      name: widget.patient.village,
    );

    context.read<SsGetProvincesBloc>().add(const SsGetProvincesEvent.doGet(codes: ''));
    super.initState();
  }

  @override
  void dispose() {
    nikC.dispose();
    noKKC.dispose();
    nameC.dispose();
    phoneC.dispose();
    emailC.dispose();
    birthPlaceC.dispose();
    birthDateC.dispose();
    addressLineC.dispose();
    rtC.dispose();
    rwC.dispose();
    postalCodeC.dispose();
    relationshipNameC.dispose();
    relationshipPhoneC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePatientBloc, UpdatePatientState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (patient) {
            ClinicAlert.successful(
                context: context, content: 'Berhasil mengupdate pasien : ${patient.name}, ${patient.gender}');
            context.pop();
            context.read<GetPatientsBloc>().add(const GetPatientsEvent.getFirst(patient: ''));
          },
          failed: (message) {
            ClinicAlert.error(context: context, content: message);
          },
        );
      },
      child: Scaffold(
        appBar: editPatientAppbar(context),
        bottomNavigationBar: updatePatientButton(
          onPressed: () {
            if (nikC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'NIK pasien tidak boleh kosong');
            } else if (noKKC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'No. KK pasien tidak boleh kosong');
            } else if (nameC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'Nama pasien tidak boleh kosong');
            } else if (phoneC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'No. Telepon pasien tidak boleh kosong');
            } else if (selectedGender == null || selectedGender == 'Pilih Jenis Kelamin') {
              ClinicAlert.notice(context: context, content: 'Pilih jenis kelamin terlebih dahulu');
            } else if (birthPlaceC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'Tempat Lahir pasien tidak boleh kosong');
            } else if (birthDateC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'Pilih Tanggal Lahir pasien terlebih dahulu');
            } else if (addressLineC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'Alamat Pasien tidak boleh kosong');
            } else if (selectedProvince == null || selectedProvince?.name == 'Pilih Provinsi') {
              ClinicAlert.notice(context: context, content: 'Pilih Provinsi terlebih dahulu');
            } else if (selectedCity == null || selectedCity?.code == '0') {
              ClinicAlert.notice(context: context, content: 'Pilih Kota terlebih dahulu');
            } else if (selectedDistrict == null || selectedDistrict?.code == '0') {
              ClinicAlert.notice(context: context, content: 'Pilih Kecamatan terlebih dahulu');
            } else if (selectedSubdistrict == null || selectedSubdistrict?.code == '0') {
              ClinicAlert.notice(context: context, content: 'Pilih Kelurahan terlebih dahulu');
            } else if (rtC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'RT pasien tidak boleh kosong');
            } else if (rwC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'RW pasien tidak boleh kosong');
            } else if (postalCodeC.text.isEmpty) {
              ClinicAlert.notice(context: context, content: 'Kode Pos pasien tidak boleh kosong');
            } else if (selectedMaritalStatus == null || selectedMaritalStatus == 'Pilih Status Perkawinan') {
              ClinicAlert.notice(context: context, content: 'Pilih Status Perkawinan terlebih dahulu');
            } else {
              context.read<UpdatePatientBloc>().add(
                    UpdatePatientEvent.updateById(
                      id: widget.patient.id,
                      nik: nikC.text,
                      noKk: noKKC.text,
                      name: nameC.text,
                      phone: phoneC.text,
                      email: emailC.text,
                      gender: selectedGender!,
                      birthPlace: birthPlaceC.text,
                      birthDate: DateTime.parse(birthDateC.text),
                      addressLine: addressLineC.text,
                      city: selectedCity!.name,
                      cityCode: selectedCity!.code,
                      province: selectedProvince!.name,
                      provinceCode: selectedProvince!.code,
                      district: selectedDistrict!.name,
                      districtCode: selectedDistrict!.code,
                      village: selectedSubdistrict!.name,
                      villageCode: selectedSubdistrict!.code,
                      rt: rtC.text,
                      rw: rwC.text,
                      postalCode: postalCodeC.text,
                      maritalStatus: selectedMaritalStatus!,
                      relationshipName: relationshipNameC.text,
                      relationshipPhone: relationshipPhoneC.text,
                      isDeceased: selectedIsDeceased!,
                    ),
                  );
            }
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  nikForm(nikC: nikC),
                  horizontalSpaces(24),
                  noKKForm(noKKC: noKKC),
                ],
              ),
              ...nameForm(nameC: nameC),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  phoneForm(phoneC: phoneC),
                  horizontalSpaces(24),
                  emailForm(emailC: emailC),
                ],
              ),
              ...selectGender(
                context: context,
                genders: genders,
                selectedGender: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  birthPlaceForm(birthPlaceC: birthPlaceC),
                  horizontalSpaces(24),
                  birthDateForm(
                    context: context,
                    birthDateC: birthDateC,
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now());

                      if (pickedDate != null) {
                        setState(() {
                          birthDateC.text = pickedDate.toString().substring(0, 10);
                        });
                      }
                    },
                  ),
                ],
              ),
              ...addressLineForm(addressLineC: addressLineC),
              Row(
                children: [
                  selectProvince(
                    selectedProvince: selectedProvince,
                    onChanged: (value) {
                      setState(() {
                        selectedProvince = value as Region;
                        if (selectedProvince?.code != '0') {
                          selectedCity = null;
                          selectedDistrict = null;
                          selectedSubdistrict = null;
                          context.read<SsGetCitiesBloc>().add(
                                SsGetCitiesEvent.doGet(
                                  provinceCodes: selectedProvince?.code ?? '',
                                ),
                              );
                        }
                      });
                    },
                  ),
                  horizontalSpaces(24),
                  selectCity(
                    selectedCity: selectedCity,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value as Region;
                        if (selectedCity?.code != '0') {
                          selectedDistrict = null;
                          selectedSubdistrict = null;
                          context
                              .read<SsGetDistrictsBloc>()
                              .add(SsGetDistrictsEvent.doGet(cityCodes: selectedCity?.code ?? ''));
                        }
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  selectDistrict(
                    selectedDistrict: selectedDistrict,
                    onChanged: (value) {
                      setState(() {
                        selectedDistrict = value as Region;
                        if (selectedDistrict?.code != '0') {
                          selectedSubdistrict = null;
                          context
                              .read<SsGetSubDistrictsBloc>()
                              .add(SsGetSubDistrictsEvent.doGet(districtCodes: selectedDistrict?.code ?? ''));
                        }
                      });
                    },
                  ),
                  horizontalSpaces(24),
                  selecSubDistrict(
                    selectedSubdistrict: selectedSubdistrict,
                    onChanged: (value) {
                      setState(() {
                        selectedSubdistrict = value as Region;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rtForm(rtC: rtC),
                  horizontalSpaces(24),
                  rwForm(
                    rwC: rwC,
                  ),
                  horizontalSpaces(24),
                  postalCodeForm(postalCodeC: postalCodeC),
                ],
              ),
              ...selectMaritalStatus(
                context: context,
                maritalStatuses: maritalStatuses,
                selectedMaritalStatus: selectedMaritalStatus,
                onChanged: (value) {
                  setState(() {
                    selectedMaritalStatus = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  relationshipNameForm(relationshipNameC: relationshipNameC),
                  horizontalSpaces(24),
                  relationshipPhoneForm(relationshipPhoneC: relationshipPhoneC),
                ],
              ),
              ...selectIsDeceased(
                context: context,
                isDeceased: isDeceased,
                selectedIsDeceased: selectedIsDeceased == 0 ? 'Hidup' : 'Meninggal',
                onChanged: (value) {
                  setState(() {
                    selectedIsDeceased = value == 'Hidup' ? 0 : 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
