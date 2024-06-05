import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/checkout/checkout.dart';

class CheckoutContent extends StatelessWidget {
  const CheckoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    // final cartSummary = context.select((CheckoutBloc bloc) => bloc.state.cartSummary);
    final isLoading = context.select((CheckoutBloc bloc) => bloc.state.status == CheckoutStatus.loading);

    if (isLoading) {
      return const AppLoadingIndicator();
    }

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: const [
              /// PAYMENT METHODS
              CheckoutPaymentMethodSelector(),

              SizedBox(height: AppSpacing.md),

              /// DELIVERY TYPES
              CheckoutDeliveryTypeSelector(),
            ],
          ),
        ),

        /// FOOTER
        const CartFooter(),
      ],
    );
  }
}
