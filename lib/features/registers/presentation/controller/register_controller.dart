import 'dart:async';
import 'dart:io';

import 'package:activosfijos/features/registers/data/repositories/register_repository_impl.dart';
import 'package:activosfijos/features/registers/domain/entiites/active_model.dart';
import 'package:activosfijos/features/registers/domain/entiites/branch.dart';
import 'package:activosfijos/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final registerRepository = RegisterRepositoryImpl();

  Rx<File> file = File('').obs;
  RxList branches = <BranchModel>[].obs;
  RxString uid = ''.obs;
  RxString urlImageFire = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController usefulLifeController = TextEditingController();
  TextEditingController acquisitionCostController = TextEditingController();
  TextEditingController responsibleController = TextEditingController();
  TextEditingController providerController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();
  TextEditingController additionalNotesController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController warrantyController = TextEditingController();
  TextEditingController conditionsController = TextEditingController();

  Future getBranches() async {
    branches.value = await registerRepository.getBranches();
  }

  String validateFields() {
    if (nameController.text.isEmpty) {
      return 'El campo nombre es obligatorio';
    }
    if (descriptionController.text.isEmpty) {
      return 'El campo descripcion es obligatorio';
    }
    if (usefulLifeController.text.isEmpty) {
      return 'El campo vida util es obligatorio';
    }
    if (acquisitionCostController.text.isEmpty) {
      return 'El campo costo de adquisicion es obligatorio';
    }
    if (responsibleController.text.isEmpty) {
      return 'El campo responsable es obligatorio';
    }
    if (providerController.text.isEmpty) {
      return 'El campo proveedor es obligatorio';
    }
    if (serialNumberController.text.isEmpty) {
      return 'El campo numero de serie es obligatorio';
    }
    if (additionalNotesController.text.isEmpty) {
      return 'El campo notas adicionales es obligatorio';
    }
    if (locationController.text.isEmpty) {
      return 'El campo ubicacion es obligatorio';
    }
    if (warrantyController.text.isEmpty) {
      return 'El campo garantia es obligatorio';
    }

    if (conditionsController.text.isEmpty) {
      return 'El campo condiciones es obligatorio';
    }
    if (file.value.path.isEmpty) {
      return 'La imagen es obligatoria';
    }
    return '';
  }

  Future saveImage() async {
    uid = Utils.generateUuid().obs;
    final response = await registerRepository.saveImage(
      file.value,
      uid.value,
    );
    if (response.isNotEmpty) {
      urlImageFire = response.obs;
    } else {
      Get.snackbar('Error', 'Error al subir la imagen');
      return;
    }
    await saveModel();
  }

  Future saveModel() async {
    ActiveModel activeModel = ActiveModel(
      nombre: nameController.text,
      descripcion: descriptionController.text,
      imagen: urlImageFire.value,
      ubicacion: locationController.text,
      categoria: branches[0].nombre,
      fechaAdquisicion: DateTime.now(),
      costoAdquisicion: int.parse(acquisitionCostController.text),
      estado: 'Activo',
      responsable: responsibleController.text,
      fechaUltimaActualizacion: DateTime.now(),
      vidaUtilEstimada: usefulLifeController.text,
      proveedor: providerController.text,
      numeroSerie: serialNumberController.text,
      notasAdicionales: additionalNotesController.text,
      ubicacionPrecisa: locationController.text,
      garantia: warrantyController.text,
      condiciones: conditionsController.text,
      id: uid.value,
    );
    final response = await registerRepository.saveRegister(activeModel);
    if (response) {
      clearFields();
      Get.close(1);
      Get.snackbar('Exito', 'Activo guardado con exito');
    } else {
      Get.snackbar('Error', 'Error al guardar el activo');
    }
  }

  Future getFile(format) async {
    final ImagePicker picker = ImagePicker();

    final XFile? result;

    if (format == 'camera') {
      result = await picker.pickImage(source: ImageSource.camera);
    } else {
      result = await picker.pickImage(source: ImageSource.gallery);
    }

    if (result != null) {
      file.value = File(result.path);
    }
  }

  void clearFields() {
    nameController.clear();
    descriptionController.clear();
    usefulLifeController.clear();
    acquisitionCostController.clear();
    responsibleController.clear();
    providerController.clear();
    serialNumberController.clear();
    additionalNotesController.clear();
    locationController.clear();
    warrantyController.clear();
    conditionsController.clear();
    file.value = File('');
  }

  static RegisterController get findOrInitialize {
    try {
      return Get.find<RegisterController>();
    } catch (e) {
      Get.put(RegisterController());
      return Get.find<RegisterController>();
    }
  }
}
