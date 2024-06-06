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
    this.selectedAddress,
  });

  final AddressStatus status;
  final List<AddressModel> addresses;
  final AddressModel? selectedAddress;

  @override
  List<Object?> get props => [
        status,
        addresses,
        selectedAddress,
      ];

  AddressState copyWith({
    AddressStatus? status,
    List<AddressModel>? addresses,
    AddressModel? selectedAddress,
  }) {
    return AddressState(
      status: status ?? this.status,
      addresses: addresses ?? this.addresses,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }
}
