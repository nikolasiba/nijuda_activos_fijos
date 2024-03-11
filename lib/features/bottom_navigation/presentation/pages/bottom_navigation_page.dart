import 'package:activosfijos/features/bottom_navigation/presentation/controller/bottom_navigation_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationPage extends StatelessWidget {
  BottomNavigationPage({Key? key}) : super(key: key);
  final navigationCtrl = BottomNavigationController.findOrInitial;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: navigationCtrl.pages[navigationCtrl.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationCtrl.currentIndex.value,
          onTap: (current) {
            navigationCtrl.changePage(current);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'test page',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'test page1',
            ),
          ],
        )));
  }
}
