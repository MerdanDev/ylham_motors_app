import 'package:flutter/material.dart';
import 'package:ylham_motors/auth/auth.dart';

class OtpVerifyPage extends StatelessWidget {
  const OtpVerifyPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(builder: (_) => const OtpVerifyPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otp verification"),
      ),
      body: const OtpVerifyContent(),
    );
  }
}
