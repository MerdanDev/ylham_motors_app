import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/addresses/addresses.dart';

class AddressesContent extends StatelessWidget {
  const AddressesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = context.select((AddressBloc bloc) => bloc.state.addresses);
    final isLoading = context.select((AddressBloc bloc) => bloc.state.status == AddressStatus.loading);

    return Stack(
      fit: StackFit.expand,
      children: [
        /// Addresses
        ListView.separated(
          itemCount: addresses.length,
          padding: const EdgeInsets.all(AppSpacing.md),
          itemBuilder: (context, index) {
            final address = addresses[index];

            return AddressCard(
              address: address,
              onPressed: () => context.read<AddressBloc>().add(AddressSelected(address)),
              onEditPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => AddressEditBottomSheet(address: address),
                );
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.md),
        ),

        /// Loading indicator
        if (isLoading) const AppLoadingIndicator(isForeground: true),
      ],
    );
  }
}
