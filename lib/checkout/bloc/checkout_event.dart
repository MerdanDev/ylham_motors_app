part of 'checkout_bloc.dart';

sealed class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

final class CheckoutRequested extends CheckoutEvent {}

final class CheckoutPaymentMethodUpdated extends CheckoutEvent {
  final PaymentMethod paymentMethod;

  const CheckoutPaymentMethodUpdated(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}

final class CheckoutDeliveryTypeUpdated extends CheckoutEvent {
  final DeliveryType deliveryType;

  const CheckoutDeliveryTypeUpdated(this.deliveryType);

  @override
  List<Object> get props => [deliveryType];
}
