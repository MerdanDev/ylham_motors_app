import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/auth/auth.dart';
import 'package:ylham_motors/navigation/navigation.dart';

class OtpVerifyPage extends StatelessWidget {
  const OtpVerifyPage({required this.phone, super.key});

  final String phone;

  static Route<void> route({
    required String phone,
  }) =>
      MaterialPageRoute<void>(
        builder: (_) => OtpVerifyPage(phone: phone),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) {
        final a = previous.status != current.status;
        final b = current.status == AuthenticationStatus.success;
        return a && b;
      },
      listener: (context, state) {
        Navigator.of(context).pushAndRemoveUntil(
          BottomNavBar.route(),
          (route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Otp verification"),
        ),
        body: OtpVerifyContent(phone: phone),
      ),
    );
  }
}
