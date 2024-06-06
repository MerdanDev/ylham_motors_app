import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CheckoutPhoneField extends StatelessWidget {
  const CheckoutPhoneField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Hokmany doldurmaly';
        }

        if (value!.length != 8) {
          return '8 belgili nomer bolmaly';
        }

        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Telefon belgiňiz",
        hintText: "61234567",
        prefixText: "+993 ",
        suffixIcon: PhosphorIcon(PhosphorIconsBold.phone),
      ),
    );
  }
}
