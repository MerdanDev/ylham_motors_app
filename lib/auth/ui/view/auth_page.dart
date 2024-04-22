import 'package:flutter/material.dart';
import 'package:ylham_motors/auth/auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(builder: (_) => const AuthPage());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Authentication page"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Register'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LoginView(),
            RegisterView(),
            // RegisterContent(),
          ],
        ),
      ),
    );
  }
}
