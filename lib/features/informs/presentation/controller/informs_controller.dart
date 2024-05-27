import 'dart:async';

import 'package:activosfijos/features/informs/data/repositories/informs_repository_impl.dart';
import 'package:activosfijos/features/registers/domain/entiites/active_model.dart';
import 'package:get/get.dart';

class InformsController extends GetxController {
  final repository = InformsRepositoryImpl();

  RxList<ActiveModel> informs = <ActiveModel>[].obs;

  Future<void> getInforms() async {
    informs.value = await repository.getInforms();
  }

  static InformsController get findOrInitialize {
    try {
      return Get.find<InformsController>();
    } catch (e) {
      Get.put(InformsController());
      return Get.find<InformsController>();
    }
  }
}
