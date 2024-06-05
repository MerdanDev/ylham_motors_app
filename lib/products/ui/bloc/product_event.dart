part of 'product_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class ProductsRequested extends ProductsEvent {}

final class ProductsRefreshRequested extends ProductsEvent {}

final class ProductsSearchUpdated extends ProductsEvent {
  final String search;

  const ProductsSearchUpdated(this.search);

  @override
  List<Object?> get props => [search];
}
