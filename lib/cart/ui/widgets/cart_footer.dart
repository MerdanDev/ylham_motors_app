import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/cart/cart.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({
    this.onSubmit,
    super.key,
  });

  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    final cart = context.select((CartBloc bloc) => bloc.state.cart);

    return AppCard(
      color: AppColors.grey.shade100,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.sm)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Jemi",
                style: const AppTextStyle.text().md().bold(),
              ),
              Text(
                cart?.totalPrice ?? '',
                style: const AppTextStyle.text().md().bold().withColor(AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            width: double.infinity,
            child: AppButton.label(
              onPressed: onSubmit,
              label: 'Sargyt et (${cart?.quantity ?? 0})',
              buttonSize: AppButtonSize.large,
            ),
          ),
        ],
      ),
    );
  }
}
