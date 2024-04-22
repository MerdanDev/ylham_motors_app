import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/addresses/addresses.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(builder: (_) => const AddressesPage());

  @override
  Widget build(BuildContext context) {
    return const AddressesView();
  }
}

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Addresses"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => const AddressEditBottomSheet(),
              );
            },
            icon: const PhosphorIcon(PhosphorIconsBold.plusCircle),
          ),
        ],
      ),
      body: const AddressesContent(),
    );
  }
}
