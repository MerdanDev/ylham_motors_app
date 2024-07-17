import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/checkout/checkout.dart';
import 'package:ylham_motors/orders/orders.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const CheckoutPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutBloc(
        cartRepository: context.read<CartRepository>(),
        orderRepository: context.read<OrderRepository>(),
      )..add(CheckoutRequested()),
      child: const CheckoutView(),
    );
  }
}

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutBloc, CheckoutState>(
      listenWhen: (previous, current) =>
          current.status == CheckoutStatus.completingSuccess,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            const SnackBar(
              content: Text('Order created successfully!'),
            ),
          );
        Navigator.pop(context);
        // TODO: navigate to orders
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        body: const CheckoutContent(),
      ),
    );
  }
}
