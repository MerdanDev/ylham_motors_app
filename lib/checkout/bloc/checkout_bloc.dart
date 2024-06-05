import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/cart/cart.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({
    required CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(const CheckoutState.initial()) {
    on<CheckoutRequested>(_onRequested);
    on<CheckoutPaymentMethodUpdated>(_onPaymentMethodUpdated);
    on<CheckoutDeliveryTypeUpdated>(_onDeliveryTypeUpdated);
  }

  final CartRepository _cartRepository;

  FutureOr<void> _onRequested(
    CheckoutRequested event,
    Emitter<CheckoutState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CheckoutStatus.loading));

      final response = await _cartRepository.getCartSummary();

      emit(state.copyWith(
        status: CheckoutStatus.success,
        cartSummary: response,
        selectedPaymentMethod: response.paymentMethods?.firstOrNull,
        selectedDeliveryType: response.deliveryTypes?.firstOrNull,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CheckoutStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onPaymentMethodUpdated(
    CheckoutPaymentMethodUpdated event,
    Emitter<CheckoutState> emit,
  ) {
    emit(state.copyWith(selectedPaymentMethod: event.paymentMethod));
  }

  FutureOr<void> _onDeliveryTypeUpdated(
    CheckoutDeliveryTypeUpdated event,
    Emitter<CheckoutState> emit,
  ) {
    emit(state.copyWith(selectedDeliveryType: event.deliveryType));
  }
}
