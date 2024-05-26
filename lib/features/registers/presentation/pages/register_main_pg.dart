import 'package:flutter/material.dart';

class RegisterMainPage extends StatelessWidget {
  const RegisterMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Main Page'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('Register Main Page'),
        ),
      ),
    );
  }
}
