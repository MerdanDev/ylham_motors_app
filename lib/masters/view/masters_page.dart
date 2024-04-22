import 'package:flutter/material.dart';
import 'package:ylham_motors/masters/masters.dart';

class MastersPage extends StatelessWidget {
  const MastersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ussalar'),
      ),
      body: const MastersListView(),
    );
  }
}
