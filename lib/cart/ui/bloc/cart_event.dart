part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class CartRequested extends CartEvent {}

final class CartInitRequested extends CartEvent {}

final class CartUpdateRequested extends CartEvent {
  final CartUpdateRequestBody body;

  const CartUpdateRequested(this.body);

  @override
  List<Object> get props => [body];
}
