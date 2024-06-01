part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class FavoritesInitRequested extends FavoritesEvent {}

final class FavoritesRequested extends FavoritesEvent {}

final class FavoritesRefreshRequested extends FavoritesEvent {}

final class FavoriteButtonPressed extends FavoritesEvent {
  final ProductItem product;

  const FavoriteButtonPressed(this.product);

  @override
  List<Object> get props => [product];
}

final class AddFavoriteRequested extends FavoritesEvent {
  final ProductItem product;

  const AddFavoriteRequested(this.product);

  @override
  List<Object> get props => [product];
}

final class RemoveFavoriteRequested extends FavoritesEvent {
  final ProductItem product;

  const RemoveFavoriteRequested(this.product);

  @override
  List<Object> get props => [product];
}
