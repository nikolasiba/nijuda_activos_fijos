import 'package:activosfijos/features/bottom_navigation/presentation/pages/test_page.dart';
import 'package:activosfijos/features/bottom_navigation/presentation/pages/test_page_1.dart';
import 'package:activosfijos/features/home/presentation/pages/home_page.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  RxList pages = [
    const HomePage(),
    const TestPage(),
    const TestPage1(),
  ].obs;

  static BottomNavigationController get findOrInitial {
    try {
      return Get.find<BottomNavigationController>();
    } catch (e) {
      return Get.put(BottomNavigationController());
    }
  }
}
