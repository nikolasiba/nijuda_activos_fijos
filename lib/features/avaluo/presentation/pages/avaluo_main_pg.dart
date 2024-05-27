import 'package:activosfijos/shared/widgets/cusotm_appbar.dart';
import 'package:flutter/material.dart';

class AvaluoMainPAge extends StatelessWidget {
  const AvaluoMainPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Avaluo',
      ),
      body: Center(
        child: Text('Modulo en desarrollo'),
      ),
    );
  }
}
