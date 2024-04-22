part of 'product_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class ProductsRequested extends ProductsEvent {
  final String? search;

  const ProductsRequested({
    this.search,
  });

  @override
  List<Object?> get props => [search];
}

final class ProductsRefreshRequested extends ProductsEvent {}
