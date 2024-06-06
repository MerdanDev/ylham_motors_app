// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checkout_bloc.dart';

enum CheckoutStatus {
  initial,
  loading,
  success,
  failure,

  completing,
  completingSuccess,
  completingFailure,
}

final class CheckoutState extends Equatable {
  const CheckoutState({
    required this.status,
    this.cartSummary,
    this.selectedPaymentMethod,
    this.selectedDeliveryType,
  });

  const CheckoutState.initial() : this(status: CheckoutStatus.initial);

  final CheckoutStatus status;
  final CartSummaryResponse? cartSummary;
  final PaymentMethod? selectedPaymentMethod;
  final DeliveryType? selectedDeliveryType;

  @override
  List<Object?> get props => [
        status,
        cartSummary,
        selectedPaymentMethod,
        selectedDeliveryType,
      ];

  CheckoutState copyWith({
    CheckoutStatus? status,
    CartSummaryResponse? cartSummary,
    PaymentMethod? selectedPaymentMethod,
    DeliveryType? selectedDeliveryType,
  }) {
    return CheckoutState(
      status: status ?? this.status,
      cartSummary: cartSummary ?? this.cartSummary,
      selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
      selectedDeliveryType: selectedDeliveryType ?? this.selectedDeliveryType,
    );
  }
}
