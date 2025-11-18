import 'package:flutter/material.dart';

class ConfirmOtpPage extends StatelessWidget {
  const ConfirmOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP')),
      body: const Center(child: Text('This is the Confirm OTP Page')),
    );
  }
}
