import 'package:activosfijos/features/auth/presentation/contoller/auth_ctr.dart';
import 'package:activosfijos/shared/colors/colors.dart';
import 'package:activosfijos/shared/utils/responsive.dart';
import 'package:activosfijos/shared/widgets/background.dart';
import 'package:activosfijos/shared/widgets/custom_card.dart';
import 'package:activosfijos/shared/widgets/custom_primary_button.dart';
import 'package:activosfijos/shared/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final authController = AuthController.findOrInitial;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Stack(children: [
        const BackgroundPage(),
        Center(
          child: CustomCard(
              borderRadius: 40,
              height: responsive.dp(50),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      color: MyColors.primaryGreen,
                      fontSize: responsive.fp(30),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: responsive.dp(6)),
                  CustomTextField(
                    labelText: 'Correo',
                    controller: authController.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: responsive.dp(4)),
                  CustomTextField(
                    labelText: 'Contraseña',
                    obscureText: true,
                    controller: authController.passwordController,
                  ),
                  SizedBox(height: responsive.dp(6)),
                  CustomPrimaryButton(
                    text: 'Ingresar',
                    onPressed: () async {
                      await authController.login();
                    },
                    color: MyColors.primaryGreen,
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
