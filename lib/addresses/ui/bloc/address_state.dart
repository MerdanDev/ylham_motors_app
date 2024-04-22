// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'address_bloc.dart';

enum AddressStatus {
  initial,

  loading,
  success,
  failure,

  updating,
  updatingSuccess,
  updatingFailure,
}

class AddressState extends Equatable {
  const AddressState({
    this.addresses = const [],
    this.status = AddressStatus.initial,
  });

  final AddressStatus status;
  final List<AddressModel> addresses;

  @override
  List<Object> get props => [status, addresses];

  AddressState copyWith({
    AddressStatus? status,
    List<AddressModel>? addresses,
  }) {
    return AddressState(
      status: status ?? this.status,
      addresses: addresses ?? this.addresses,
    );
  }
}
