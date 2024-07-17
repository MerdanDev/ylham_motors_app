import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/l10n/l10n.dart';

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
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: context.l10n.firstname,
        suffixIcon: const PhosphorIcon(PhosphorIconsBold.user),
      ),
    );
  }
}
