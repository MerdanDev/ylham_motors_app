import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/products/products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;

  ProductsBloc({
    this.category,
    this.brand,
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductsState.initial()) {
    on<ProductsRequested>(_onProductsRequested);
    on<ProductsRefreshRequested>(_onProductsRefreshRequested);
  }

  final CategoryItem? category;
  final BrandItem? brand;

  bool _isFetching = false;

  FutureOr<void> _onProductsRequested(
    ProductsRequested event,
    Emitter<ProductsState> emit,
  ) async {
    if (_isFetching || !state.hasMoreContent) return;

    _isFetching = true;

    try {
      emit(state.copyWith(status: ProductsStatus.loading));

      final response = await _productRepository.getProducts(
        GetProductListQueryParameters(
          search: event.search,
          brandId: brand?.id,
          categoryId: category?.id,
          page: state.page + 1,
        ),
      );

      final content = response.data ?? const [];

      emit(state.copyWith(
        status: ProductsStatus.populated,
        products: {...state.products, ...content}.toList(),
        page: state.page + 1,
        hasMoreContent: content.isNotEmpty,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: ProductsStatus.failure));
      addError(error, stackTrace);
    } finally {
      _isFetching = false;
    }
  }

  FutureOr<void> _onProductsRefreshRequested(
    ProductsRefreshRequested event,
    Emitter<ProductsState> emit,
  ) {
    emit(const ProductsState.initial());
    add(const ProductsRequested());
  }
}
