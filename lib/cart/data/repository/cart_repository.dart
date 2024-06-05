import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the Cart repository failures
abstract class CartFailure with EquatableMixin implements Exception {
  const CartFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetCartFailure extends CartFailure {
  const GetCartFailure(super.error);
}

class GetCartSummaryFailure extends CartFailure {
  const GetCartSummaryFailure(super.error);
}

class UpdateCartFailure extends CartFailure {
  const UpdateCartFailure(super.error);
}

class UpdateCartItemFailure extends CartFailure {
  const UpdateCartItemFailure(super.error);
}

class FlushCartFailure extends CartFailure {
  const FlushCartFailure(super.error);
}

class CompleteCartFailure extends CartFailure {
  const CompleteCartFailure(super.error);
}

class CartRepository {
  const CartRepository({
    required CartClient cartClient,
  }) : _cartClient = cartClient;

  final CartClient _cartClient;

  Future<CartResponse> getCart() async {
    try {
      return await _cartClient.getCart();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetCartFailure(error), stackTrace);
    }
  }

  Future<CartResponse> updateCart(CartUpdateRequestBody body) async {
    try {
      return await _cartClient.updateCart(body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(UpdateCartFailure(error), stackTrace);
    }
  }

  Future<CartSummaryResponse> getCartSummary() async {
    try {
      return await _cartClient.getCartSummary();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetCartSummaryFailure(error), stackTrace);
    }
  }
}
