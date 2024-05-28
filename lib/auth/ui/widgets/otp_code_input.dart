import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OtpCodeInput extends StatelessWidget {
  const OtpCodeInput({
    this.controller,
    this.onChanged,
    this.readOnly = false,
    super.key,
  });

  final TextEditingController? controller;
  final void Function(String phone)? onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Kod",
        suffixIcon: PhosphorIcon(PhosphorIconsBold.code),
      ),
    );
  }
}
