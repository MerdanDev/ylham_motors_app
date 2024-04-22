part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

final class CategoriesRequested extends CategoriesEvent {
  const CategoriesRequested();
}
