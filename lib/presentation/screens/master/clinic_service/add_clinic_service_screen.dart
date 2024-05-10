import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic/presentation/blocs/master/clinic_service/get_clinic_services_bloc/get_clinic_services_bloc.dart';
import 'package:flutter_clinic/presentation/extension/clinic_alert.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/methods/add_clinic_service_appbar.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/methods/add_service_button.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/methods/price_form.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/methods/qty_form.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/methods/service_category_dropdown.dart';
import 'package:flutter_clinic/presentation/screens/master/clinic_service/methods/service_name_form.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/master/clinic_service/create_clinic_service_bloc/create_clinic_service_bloc.dart';

class AddClinicServiceScreen extends StatefulWidget {
  static const routerName = 'add-clinic-service';
  const AddClinicServiceScreen({super.key});

  @override
  State<AddClinicServiceScreen> createState() => _AddClinicServiceScreenState();
}

class _AddClinicServiceScreenState extends State<AddClinicServiceScreen> {
  TextEditingController nameC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController qtyC = TextEditingController();
  String? selectedCategory;

  @override
  void dispose() {
    nameC.dispose();
    priceC.dispose();
    qtyC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateClinicServiceBloc, CreateClinicServiceState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (clinicService) {
            ClinicAlert.successful(context: context, content: 'Berhasil menambah layanan baru : ${clinicService.name}');
            context.read<GetClinicServicesBloc>().add(const GetClinicServicesEvent.getAll(name: ''));
            context.pop();
          },
          failed: (message) {
            ClinicAlert.error(context: context, content: message);
          },
        );
      },
      child: Scaffold(
        appBar: addClinicServiceAppbar(context),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              ...serviceNameForm(nameC: nameC),
              ...serviceCategoryDropdown(
                selectedCategory: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              ...priceForm(priceC: priceC),
              ...qtyForm(qtyC: qtyC),
              addServiceButton(
                onPressed: () {
                  if (nameC.text.isEmpty) {
                    ClinicAlert.error(context: context, content: 'Nama Layanan harus diisi');
                  } else if (selectedCategory == null || selectedCategory == 'Pilih Kategori') {
                    ClinicAlert.error(context: context, content: 'Pilih Kategori Layanan terlebih dahulu');
                  } else if (priceC.text.isEmpty) {
                    ClinicAlert.error(context: context, content: 'Harga Layanan harus diisi, minimal 100');
                  } else if (qtyC.text.isEmpty) {
                    ClinicAlert.error(context: context, content: 'Qty Layanan harus diisi, minimal 1');
                  } else {
                    context.read<CreateClinicServiceBloc>().add(
                          CreateClinicServiceEvent.doCreate(
                            name: nameC.text,
                            category: selectedCategory!,
                            price: int.parse(priceC.text),
                            qty: int.parse(qtyC.text),
                          ),
                        );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
