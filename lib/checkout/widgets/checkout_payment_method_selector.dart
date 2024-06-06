import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/checkout/checkout.dart';

class CheckoutPaymentMethodSelector extends StatelessWidget {
  const CheckoutPaymentMethodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentMethods = context.select((CheckoutBloc bloc) => bloc.state.cartSummary?.paymentMethods) ?? const [];
    final selectedPaymentMethod = context.select((CheckoutBloc bloc) => bloc.state.selectedPaymentMethod);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        const CheckoutHeadline('Toleg usuly'),

        const SizedBox(height: AppSpacing.md),

        /// PAYMENT METHODS
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: paymentMethods.length,
          separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.md),
          itemBuilder: (context, index) {
            final paymentMethod = paymentMethods[index];

            return AppCard(
              padding: EdgeInsets.zero,
              child: CheckboxListTile(
                title: Text(paymentMethod.description ?? ''),
                value: selectedPaymentMethod?.key == paymentMethod.key,
                onChanged: (bool? value) {
                  context.read<CheckoutBloc>().add(CheckoutPaymentMethodUpdated(paymentMethod));
                },
              ),
            );
          },
        )
      ],
    );
  }
}
