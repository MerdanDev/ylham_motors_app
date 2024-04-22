import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/products/products.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({required this.cartItem, super.key});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppCard(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ProductImage(imageUrl: cartItem.product?.image ?? ''),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                cartItem.product?.price ?? '',
                                style: const AppTextStyle.text().md().semiBold(),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Text(
                                cartItem.product?.price ?? '',
                                style: const AppTextStyle.text().sm().medium().copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey.shade600,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            cartItem.product?.name ?? '',
                            style: const AppTextStyle.text().md().semiBold(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          // Text(
                          //   cartItem.product?.description ?? '',
                          //   style: const AppTextStyle.text().regular().copyWith(fontSize: 10),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                child: Divider(height: 1),
              ),
              CartItemCardFooter(cartItem: cartItem),
            ],
          ),
        ),

        /// DESTROY BUTTON
        Positioned(
          top: AppSpacing.xs,
          right: AppSpacing.xs,
          child: IconButton(
            color: AppColors.danger,
            onPressed: () {
              context.read<CartBloc>().add(
                    CartUpdateRequested(
                      CartUpdateRequestBody(
                        productId: cartItem.product!.id!,
                        quantity: 0,
                      ),
                    ),
                  );
            },
            icon: const PhosphorIcon(PhosphorIconsRegular.xCircle),
          ),
        ),
      ],
    );
  }
}

class CartItemCardFooter extends StatelessWidget {
  const CartItemCardFooter({
    required this.cartItem,
    super.key,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            cartItem.totalPrice!,
            style: const AppTextStyle.text().md().semiBold(),
          ),
        ),
        Expanded(
          flex: 2,
          child: ProductQuantityCounter(
            quantity: cartItem.quantity!,
            onQuantityUpdated: (quantity) {
              context.read<CartBloc>().add(
                    CartUpdateRequested(
                      CartUpdateRequestBody(
                        productId: cartItem.product!.id!,
                        quantity: quantity,
                      ),
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}
