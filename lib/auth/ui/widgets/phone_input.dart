import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/l10n/l10n.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
    super.key,
    this.onChanged,
    this.readOnly = false,
    this.initialValue,
    this.error,
  });

  final void Function(String phone)? onChanged;
  final bool readOnly;
  final String? initialValue;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      validator: (_) => error,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: context.l10n.phoneNumber,
        hintText: "61234567",
        prefixText: "+993 ",
        suffixIcon: const PhosphorIcon(PhosphorIconsBold.phone),
        // errorText: error,
      ),
    );
  }
}
