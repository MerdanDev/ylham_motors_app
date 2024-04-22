import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the Brand repository failures
abstract class AddressFailure with EquatableMixin implements Exception {
  const AddressFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetAddressesFailure extends AddressFailure {
  const GetAddressesFailure(super.error);
}

class CreateAddressFailure extends AddressFailure {
  const CreateAddressFailure(super.error);
}

class UpdateAddressFailure extends AddressFailure {
  const UpdateAddressFailure(super.error);
}

class DeleteAddressFailure extends AddressFailure {
  const DeleteAddressFailure(super.error);
}

class FlushAddressesFailure extends AddressFailure {
  const FlushAddressesFailure(super.error);
}

class AddressRepository {
  const AddressRepository({
    required UserAddressBox userAddressBox,
  }) : _userAddressBox = userAddressBox;

  final UserAddressBox _userAddressBox;

  /// Get all addresses
  Future<List<AddressModel>> getAddresses() async {
    try {
      return _userAddressBox.values.toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetAddressesFailure(error), stackTrace);
    }
  }

  /// Create address
  Future<void> createAddress(AddressModel address) async {
    try {
      await _userAddressBox.put(address.uuid, address);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(CreateAddressFailure(error), stackTrace);
    }
  }

  /// Remove address
  Future<void> removeAddress(AddressModel address) async {
    try {
      await address.delete();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(DeleteAddressFailure(error), stackTrace);
    }
  }

  /// Update address
  Future<void> updateAddress(AddressModel address) async {
    try {
      await _userAddressBox.put(address.uuid, address);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(UpdateAddressFailure(error), stackTrace);
    }
  }

  /// Flush addresses
  Future<void> flushAddresses() async {
    try {
      await _userAddressBox.clear();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(FlushAddressesFailure(error), stackTrace);
    }
  }
}
