import 'package:activosfijos/features/auth/presentation/pages/auth_page.dart';
import 'package:activosfijos/firebase_options.dart';
import 'package:activosfijos/shared/colors/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nijuda Activos Fijos',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryGreen),
          useMaterial3: true,
        ),
        home: AuthPage());
  }
}
