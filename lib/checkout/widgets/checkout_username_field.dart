import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CheckoutUsernameField extends StatelessWidget {
  const CheckoutUsernameField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Hokmany doldurmaly';
        }

        if (value!.length < 3) {
          return 'In azyndan 3 harp bolmaly';
        }

        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Ulanyjynyn ady",
        suffixIcon: PhosphorIcon(PhosphorIconsBold.user),
      ),
    );
  }
}
