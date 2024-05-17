import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/cart/cart.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.select((CartBloc bloc) => bloc.state.cart);
    final isCartEmpty = context.select((CartBloc bloc) => bloc.state.isCartEmpty);

    /// CART EMPTY
    if (isCartEmpty) return const CartEmpty();

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: cart?.items?.length ?? 0,
            itemBuilder: (context, index) {
              return CartItemCard(cartItem: cart!.items![index]);
            },
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
          ),
        ),

        /// FOOTER
        if (!isCartEmpty) const CartFooter(),
      ],
    );
  }
}

class CartFooter extends StatelessWidget {
  const CartFooter({super.key});

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
              onPressed: () {},
              label: 'Sargyt et (${cart?.quantity ?? 0})',
              buttonSize: AppButtonSize.large,
            ),
          ),
        ],
      ),
    );
  }
}
