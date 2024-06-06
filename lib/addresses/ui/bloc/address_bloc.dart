import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/addresses/addresses.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc({
    required AddressRepository addressRepository,
  })  : _addressRepository = addressRepository,
        super(const AddressState()) {
    on<AddressesRequested>(_onRequested);
    on<AddressCreateRequested>(_onCreateRequested);
    on<AddressUpdateRequested>(_onUpdateRequested);
    on<AddressDeleteRequested>(_onDeleteRequested);
    on<AddressFlushRequested>(_onFlushRequested);
    on<AddressSelected>(_onSelected);
  }

  final AddressRepository _addressRepository;

  FutureOr<void> _onRequested(AddressesRequested event, Emitter<AddressState> emit) async {
    try {
      emit(state.copyWith(status: AddressStatus.loading));

      final addresses = await _addressRepository.getAddresses();

      emit(state.copyWith(
        status: AddressStatus.success,
        addresses: addresses,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AddressStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onCreateRequested(
    AddressCreateRequested event,
    Emitter<AddressState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AddressStatus.updating));

      await _addressRepository.createAddress(event.address);
      final addresses = await _addressRepository.getAddresses();

      emit(state.copyWith(
        status: AddressStatus.updatingSuccess,
        addresses: addresses,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AddressStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onUpdateRequested(
    AddressUpdateRequested event,
    Emitter<AddressState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AddressStatus.updating));

      await _addressRepository.updateAddress(event.address);
      final addresses = await _addressRepository.getAddresses();

      emit(state.copyWith(
        status: AddressStatus.updatingSuccess,
        addresses: addresses,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AddressStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onDeleteRequested(
    AddressDeleteRequested event,
    Emitter<AddressState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AddressStatus.updating));

      await _addressRepository.removeAddress(event.address);
      final addresses = await _addressRepository.getAddresses();

      emit(state.copyWith(
        status: AddressStatus.updatingSuccess,
        addresses: addresses,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AddressStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onFlushRequested(
    AddressFlushRequested event,
    Emitter<AddressState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AddressStatus.updating));

      await _addressRepository.flushAddresses();
      final addresses = await _addressRepository.getAddresses();

      emit(state.copyWith(
        status: AddressStatus.updatingSuccess,
        addresses: addresses,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AddressStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onSelected(
    AddressSelected event,
    Emitter<AddressState> emit,
  ) {
    emit(state.copyWith(selectedAddress: event.address));
  }
}
