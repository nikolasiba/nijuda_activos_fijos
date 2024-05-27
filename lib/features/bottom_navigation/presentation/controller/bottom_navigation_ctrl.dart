import 'package:activosfijos/features/avaluo/presentation/pages/avaluo_main_pg.dart';
import 'package:activosfijos/features/conciliation/presentation/pages/conciliation_main_pg.dart';
import 'package:activosfijos/features/home/presentation/pages/home_page.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  RxList pages = [
    const HomePage(),
    const AvaluoMainPAge(),
    const ConciliationMainPage(),
  ].obs;

  static BottomNavigationController get findOrInitial {
    try {
      return Get.find<BottomNavigationController>();
    } catch (e) {
      return Get.put(BottomNavigationController());
    }
  }
}
