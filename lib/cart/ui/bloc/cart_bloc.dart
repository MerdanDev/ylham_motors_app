import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/cart/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({
    required CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(const CartState.initial()) {
    on<CartInitRequested>(_onInitRequested);
    on<CartRequested>(_onRequested);
    on<CartUpdateRequested>(_onUpdateRequested);
  }

  final CartRepository _cartRepository;

  int getProductQuantity(int? productId) {
    return state.cart?.items?.where((e) => e.productId == productId).firstOrNull?.quantity ?? 0;
  }

  FutureOr<void> _onInitRequested(
    CartInitRequested event,
    Emitter<CartState> emit,
  ) async {
    if (state.status != CartStatus.initial) return;
    add(CartRequested());
  }

  FutureOr<void> _onRequested(
    CartRequested event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.loading));

      final cartResponse = await _cartRepository.getCart();

      emit(state.copyWith(
        status: CartStatus.loadingSuccess,
        cart: cartResponse.data,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.loadingFailure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onUpdateRequested(
    CartUpdateRequested event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.updating));

      final cartResponse = await _cartRepository.updateCart(event.body);

      emit(state.copyWith(
        status: CartStatus.updatingSuccess,
        cart: cartResponse.data,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }
}
