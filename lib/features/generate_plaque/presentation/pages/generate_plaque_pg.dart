import 'package:flutter/material.dart';

class GeneratePlaquePage extends StatelessWidget {
  const GeneratePlaquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Plaque Page'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('Generate Plaque Page'),
        ),
      ),
    );
  }
}
