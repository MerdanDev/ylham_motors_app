import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/cart/cart.dart';

class CartQuantityBadge extends StatelessWidget {
  const CartQuantityBadge({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final quantity = context.select((CartBloc bloc) => bloc.state.cart?.quantity ?? 0);

    if (quantity == 0) return child;

    return Badge.count(
      count: quantity,
      child: child,
    );
  }
}
