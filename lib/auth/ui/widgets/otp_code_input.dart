import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OtpCodeInput extends StatelessWidget {
  const OtpCodeInput({
    super.key,
    this.onChanged,
    this.readOnly = false,
  });

  final void Function(String phone)? onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
