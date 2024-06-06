import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CheckoutNotesField extends StatelessWidget {
  const CheckoutNotesField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Gosmaca maglumat",
        alignLabelWithHint: true,
      ),
    );
  }
}
