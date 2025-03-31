import 'package:activosfijos/shared/widgets/cusotm_appbar.dart';
import 'package:flutter/material.dart';

class ConciliationMainPage extends StatelessWidget {
  const ConciliationMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Conciliacion',
      ),
      body: Center(
        child: Text('Modulo en desarrollo'),
      ),
    );
  }
}
