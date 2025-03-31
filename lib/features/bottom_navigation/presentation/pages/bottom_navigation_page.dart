import 'package:activosfijos/features/bottom_navigation/presentation/controller/bottom_navigation_ctrl.dart';
import 'package:activosfijos/shared/assets/assets.dart';
import 'package:activosfijos/shared/colors/colors.dart';
import 'package:activosfijos/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationPage extends StatelessWidget {
  BottomNavigationPage({super.key});
  final navigationCtrl = BottomNavigationController.findOrInitial;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Obx(() => Scaffold(
        body: navigationCtrl.pages[navigationCtrl.currentIndex.value],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            fixedColor: MyColors.white,
            backgroundColor: MyColors.primaryGreen,
            currentIndex: navigationCtrl.currentIndex.value,
            onTap: (current) {
              navigationCtrl.changePage(current);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  Res.images.registers,
                  height: responsive.dp(3.5),
                  color: navigationCtrl.currentIndex.value == 0
                      ? MyColors.white
                      : MyColors.black,
                ),
                label: 'Registros',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Res.images.avaluos,
                  height: responsive.dp(3.5),
                  color: navigationCtrl.currentIndex.value == 1
                      ? MyColors.white
                      : MyColors.black,
                ),
                label: 'Avaluos',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Res.images.conciliaciones,
                  height: responsive.dp(3.5),
                  color: navigationCtrl.currentIndex.value == 2
                      ? MyColors.white
                      : MyColors.black,
                ),
                label: 'Conciliaciones',
              ),
            ],
          ),
        )));
  }
}
