import 'package:flutter/material.dart';
import 'package:ylham_motors/profile/profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: const ProfileContent(),
    );
  }
}
