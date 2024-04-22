import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

typedef QuantityUpdateCallback = void Function(int quantity);

class ProductQuantityCounter extends StatelessWidget {
  const ProductQuantityCounter({
    required this.quantity,
    required this.onQuantityUpdated,
    Key? key,
  }) : super(key: key);

  final int quantity;
  final QuantityUpdateCallback onQuantityUpdated;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButton.icon(
            onPressed: () => onQuantityUpdated(quantity - 1),
            icon: const Icon(Icons.arrow_left_rounded),
          ),
          Expanded(
            child: Text(
              quantity.toString(),
              textAlign: TextAlign.center,
              style: const AppTextStyle.text().sm().semiBold().withColor(Colors.white),
            ),
          ),
          AppButton.icon(
            onPressed: () => onQuantityUpdated(quantity + 1),
            icon: const Icon(Icons.arrow_right_rounded),
          ),
        ],
      ),
    );
  }
}
