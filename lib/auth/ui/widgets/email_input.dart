import 'package:flutter/material.dart';

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
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Email",
        suffixIcon: Icon(Icons.email_outlined),
      ),
    );
  }
}
