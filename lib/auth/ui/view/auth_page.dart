import 'package:flutter/material.dart';
import 'package:ylham_motors/auth/auth.dart';
import 'package:ylham_motors/l10n/l10n.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute<void>(builder: (_) => const AuthPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.authenticationPage),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.login),
              Tab(text: l10n.register),
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
