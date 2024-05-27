import 'package:activosfijos/features/registers/presentation/controller/register_controller.dart';
import 'package:activosfijos/shared/colors/colors.dart';
import 'package:activosfijos/shared/widgets/cusotm_appbar.dart';
import 'package:activosfijos/shared/widgets/custom_primary_button.dart';
import 'package:activosfijos/shared/widgets/custom_textfield.dart';
import 'package:activosfijos/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterMainPage extends StatelessWidget {
  RegisterMainPage({super.key});

  final controller = RegisterController.findOrInitialize;
  @override
  Widget build(BuildContext context) {
    controller.getBranches();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Registro de activos fijos',
        goBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  labelText: 'Nombre',
                  controller: controller.nameController,
                ),
                const Separator(size: 2),
                CustomTextField(
                  labelText: 'Descripcion',
                  controller: controller.descriptionController,
                ),
                const Separator(size: 2),
                CustomTextField(
                  labelText: 'Vida util estimada (años)',
                  controller: controller.usefulLifeController,
                  keyboardType: TextInputType.number,
                ),
                const Separator(size: 2),
                CustomTextField(
                    labelText: 'Costo de adquisicion',
                    controller: controller.acquisitionCostController,
                    keyboardType: TextInputType.number),
                const Separator(size: 2),
                CustomTextField(
                  labelText: 'Responsable',
                  controller: controller.responsibleController,
                ),
                const Separator(size: 2),
                CustomTextField(
                    labelText: 'Proveedor',
                    controller: controller.providerController),
                const Separator(size: 2),
                CustomTextField(
                    labelText: 'Numero de serie',
                    controller: controller.serialNumberController),
                const Separator(size: 2),
                CustomTextField(
                    labelText: 'Notas adicionales',
                    controller: controller.additionalNotesController),
                const Separator(size: 2),
                CustomTextField(
                  labelText: 'Ubicacion',
                  controller: controller.locationController,
                ),
                const Separator(size: 2),
                CustomTextField(
                  labelText: 'garantia (años)',
                  controller: controller.warrantyController,
                  keyboardType: TextInputType.number,
                ),
                const Separator(size: 2),
                CustomTextField(
                  labelText: 'Condicion',
                  controller: controller.conditionsController,
                ),
                const Separator(size: 2),
                InkWell(
                    onTap: () async {
                      await controller.getFile('camera');
                    },
                    child: Container(
                        width: 200,
                        height: controller.file.value.path == '' ? 100 : 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: MyColors.primaryGreen),
                        ),
                        child: Obx(
                          () => Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              controller.file.value.path == ''
                                  ? Icon(
                                      Icons.add_a_photo_outlined,
                                      color: MyColors.primaryGreen,
                                      size: 30,
                                    )
                                  : Image.file(
                                      controller.file.value,
                                      fit: BoxFit.scaleDown,
                                      width: 50,
                                      height: 50,
                                    ),
                              Text(
                                'Agregar imagen(*)',
                                style: TextStyle(color: MyColors.primaryGreen),
                              ),
                            ],
                          )),
                        ))),
                const Separator(size: 2),
                CustomPrimaryButton(
                    text: 'Guardar',
                    onPressed: () async {
                      String resposne = controller.validateFields();
                      if (resposne == '') {
                        Get.snackbar('Enviando datos', 'Espere un momento',
                            showProgressIndicator: true,
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: MyColors.primaryGreen,
                            colorText: MyColors.white);
                        await controller.saveImage();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(resposne),
                          backgroundColor: MyColors.primaryGreen,
                        ));
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
