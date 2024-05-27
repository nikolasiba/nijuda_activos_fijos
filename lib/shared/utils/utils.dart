import 'package:activosfijos/shared/colors/colors.dart';
import 'package:get/get.dart';

class Utils {
  static String getInitials(String name) {
    List<String> nameSplit = name.split(" ");
    String initials = "";
    int numWords = nameSplit.length > 1 ? 2 : 1;
    for (var i = 0; i < numWords; i++) {
      initials += nameSplit[i][0];
    }
    return initials;
  }

  static String generateUuid() {
    DateTime now = DateTime.now();
    return now.year.toString() +
        now.month.toString() +
        now.day.toString() +
        now.hour.toString() +
        now.minute.toString() +
        now.second.toString() +
        now.millisecond.toString() +
        now.microsecond.toString();
  }

  static void showToast() {
    Get.snackbar(
      "Modulo no disponible",
      "Este modulo no esta disponible aun, estamos trabajando en ello.",
      snackPosition: SnackPosition.TOP,
      backgroundColor: MyColors.primaryGreen,
      colorText: MyColors.white,
    );
  }
}
