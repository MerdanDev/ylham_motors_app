import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the category repository failures
abstract class CategoryFailure with EquatableMixin implements Exception {
  const CategoryFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetCategoryListFailure extends CategoryFailure {
  const GetCategoryListFailure(super.error);
}

class CategoryRepository {
  const CategoryRepository({
    required CategoryClient categoryClient,
  }) : _categoryClient = categoryClient;

  final CategoryClient _categoryClient;

  Future<CategoryListResponse> getCategories() async {
    try {
      return await _categoryClient.getCategories();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetCategoryListFailure(error), stackTrace);
    }
  }
}
