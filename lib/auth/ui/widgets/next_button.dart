import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    const trailing = PhosphorIcon(PhosphorIconsBold.caretCircleRight);
    const loading = SizedBox.square(dimension: 24, child: CircularProgressIndicator());

    return AppButton.label(
      onPressed: isLoading ? null : onPressed,
      label: 'Dowam et',
      trailing: isLoading ? loading : trailing,
      buttonSize: AppButtonSize.large,
      buttonType: AppButtonType.primary,
    );
  }
}
