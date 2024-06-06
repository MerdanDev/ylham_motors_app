import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/addresses/addresses.dart';

typedef AddressSelectCallback = void Function(AddressModel address);

class AddressesPage extends StatelessWidget {
  const AddressesPage({
    this.onAddressSelected,
    super.key,
  });

  final AddressSelectCallback? onAddressSelected;

  static Route<void> route({
    AddressSelectCallback? onAddressSelected,
  }) =>
      MaterialPageRoute<void>(
        builder: (_) => AddressesPage(
          onAddressSelected: onAddressSelected,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listenWhen: (previous, current) => previous.selectedAddress != current.selectedAddress,
      listener: (context, state) {
        if (state.selectedAddress == null) return;
        onAddressSelected?.call(state.selectedAddress!);
      },
      child: const AddressesView(),
    );
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
