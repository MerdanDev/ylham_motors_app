import 'package:flutter/material.dart';
import 'package:ylham_motors/l10n/l10n.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
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
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: context.l10n.email,
        suffixIcon: const Icon(Icons.email_outlined),
      ),
    );
  }
}
