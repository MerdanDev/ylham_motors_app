import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/addresses/addresses.dart';

class CheckoutAddressField extends StatelessWidget {
  const CheckoutAddressField({
    super.key,
    this.error,
  });

  final String? error;

  @override
  Widget build(BuildContext context) {
    final address = context.select((AddressBloc bloc) => bloc.state.selectedAddress);

    return InkWell(
      onTap: () => Navigator.of(context).push(AddressesPage.route(
        onAddressSelected: (address) {
          Navigator.of(context).pop();
        },
      )),
      child: Ink(
        child: InputDecorator(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Ertip bermeli adresiniz",
            suffixIcon: const PhosphorIcon(PhosphorIconsBold.mapPin),
            errorText: error,
          ),
          child: Text(
            address?.address ?? 'Select address',
            style: TextStyle(color: AppColors.primary.shade400),
          ),
        ),
      ),
    );
  }
}
