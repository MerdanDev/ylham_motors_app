import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/checkout/checkout.dart';

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
      )..add(CheckoutRequested()),
      child: const CheckoutView(),
    );
  }
}

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: const CheckoutContent(),
    );
  }
}
