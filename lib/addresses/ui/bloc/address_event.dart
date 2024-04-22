part of 'address_bloc.dart';

sealed class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

sealed class AddressBaseActionEvent extends AddressEvent {
  final AddressModel address;

  const AddressBaseActionEvent(this.address);

  @override
  List<Object> get props => [address];
}

final class AddressesRequested extends AddressEvent {}

final class AddressCreateRequested extends AddressBaseActionEvent {
  const AddressCreateRequested(super.address);
}

final class AddressUpdateRequested extends AddressBaseActionEvent {
  const AddressUpdateRequested(super.address);
}

final class AddressDeleteRequested extends AddressBaseActionEvent {
  const AddressDeleteRequested(super.address);
}

final class AddressFlushRequested extends AddressEvent {}
