import 'package:activosfijos/features/auth/data/datasource/remote/auth_firebase.dart';
import 'package:activosfijos/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:activosfijos/features/auth/domain/repositories/auth_repository.dart';
import 'package:activosfijos/features/bottom_navigation/presentation/pages/bottom_navigation_page.dart';
import 'package:activosfijos/shared/widgets/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository repository =
      AuthRepositoryImpl(authFirebase: AuthFirebase());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      CustomAlert(
          title: 'Error',
          body: 'Los campos de usuario y contraseña son obligatorios');
      return;
    }
    bool response = await repository.loginFirebase(
        email: emailController.text, password: passwordController.text);

    if (response) {
      CustomAlert(
        title: 'Bienvenido',
        body: 'Ingreso exitoso',
        onPressed: () => Get.offAll(
          () => BottomNavigationPage(),
        ),
      );
    } else {
      CustomAlert(
        title: 'Error',
        body:
            'Usuario o contraseña incorrectos, verifique e intente nuevamente',
      );
    }
  }

  static AuthController get findOrInitial {
    try {
      return Get.find<AuthController>();
    } catch (e) {
      return Get.put(AuthController());
    }
  }
}
