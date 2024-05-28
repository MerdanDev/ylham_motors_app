import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the product repository failures
abstract class ProductFailure with EquatableMixin implements Exception {
  const ProductFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetProductsFailure extends ProductFailure {
  const GetProductsFailure(super.error);
}

class GetFavoritesFailure extends ProductFailure {
  const GetFavoritesFailure(super.error);
}

class ProductRepository {
  const ProductRepository({
    required ProductClient productClient,
  }) : _productClient = productClient;

  final ProductClient _productClient;

  Future<ProductListResponse> getProducts([GetProductListQueryParameters? queryParameters]) async {
    try {
      return await _productClient.getProducts(queryParameters);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetProductsFailure(error), stackTrace);
    }
  }

  Future<ProductListResponse> getFavorites({
    int page = 1,
  }) async {
    try {
      return await _productClient.getFavorites(page: page);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetFavoritesFailure(error), stackTrace);
    }
  }
}
