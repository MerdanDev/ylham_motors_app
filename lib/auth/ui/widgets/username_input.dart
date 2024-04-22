import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    super.key,
    this.onChanged,
    this.readOnly = false,
    this.initialValue,
  });

  final void Function(String phone)? onChanged;
  final bool readOnly;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Username",
        suffixIcon: PhosphorIcon(PhosphorIconsBold.user),
      ),
    );
  }
}
