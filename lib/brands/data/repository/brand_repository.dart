import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the Brand repository failures
abstract class BrandFailure with EquatableMixin implements Exception {
  const BrandFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetBrandListFailure extends BrandFailure {
  const GetBrandListFailure(super.error);
}

class BrandRepository {
  const BrandRepository({
    required BrandClient brandClient,
  }) : _brandClient = brandClient;

  final BrandClient _brandClient;

  Future<BrandListResponse> getCategories() async {
    try {
      return await _brandClient.getCategories();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetBrandListFailure(error), stackTrace);
    }
  }
}
