import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CheckoutHeadline extends StatelessWidget {
  const CheckoutHeadline(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const AppTextStyle.text().sm().semiBold().withColor(AppColors.primary.shade300),
    );
  }
}
