import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/checkout/checkout.dart';

class CheckoutDeliveryTypeSelector extends StatelessWidget {
  const CheckoutDeliveryTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final deliveryTypes = context.select((CheckoutBloc bloc) => bloc.state.cartSummary?.deliveryTypes) ?? const [];
    final selectedDeliveryType = context.select((CheckoutBloc bloc) => bloc.state.selectedDeliveryType);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        const CheckoutHeadline('Eltip bermek usuly'),

        const SizedBox(height: AppSpacing.md),

        /// PAYMENT METHODS
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: deliveryTypes.length,
          separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.md),
          itemBuilder: (context, index) {
            final deliveryType = deliveryTypes[index];

            return AppCard(
              padding: EdgeInsets.zero,
              child: CheckboxListTile(
                title: Text(deliveryType.name ?? ''),
                value: selectedDeliveryType?.key == deliveryType.key,
                onChanged: (bool? value) {
                  context.read<CheckoutBloc>().add(CheckoutDeliveryTypeUpdated(deliveryType));
                },
              ),
            );
          },
        )
      ],
    );
  }
}
