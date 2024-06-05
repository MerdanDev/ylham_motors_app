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
