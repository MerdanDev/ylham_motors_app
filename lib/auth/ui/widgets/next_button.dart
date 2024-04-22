import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NextButton extends StatelessWidget {
  const NextButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton.label(
      onPressed: onPressed,
      label: 'Dowam et',
      trailing: const PhosphorIcon(PhosphorIconsBold.caretCircleRight),
      buttonSize: AppButtonSize.large,
      buttonType: AppButtonType.primary,
    );
  }
}
