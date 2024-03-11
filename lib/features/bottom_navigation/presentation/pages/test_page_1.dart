import 'package:flutter/material.dart';

class TestPage1 extends StatelessWidget {
  const TestPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page1'),
      ),
      body: const Center(
        child: Text('Test Page1'),
      ),
    );
  }
}
