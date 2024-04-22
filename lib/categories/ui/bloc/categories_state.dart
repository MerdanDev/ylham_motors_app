// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'categories_bloc.dart';

enum CategoriesStatus {
  initial,
  loading,
  populated,
  failure,
}

final class CategoriesState extends Equatable {
  const CategoriesState({
    required this.status,
    this.categories = const [],
  });

  const CategoriesState.initial() : this(status: CategoriesStatus.initial);

  final CategoriesStatus status;
  final List<CategoryItem> categories;

  @override
  List<Object> get props => [
        status,
        categories,
      ];

  CategoriesState copyWith({
    CategoriesStatus? status,
    List<CategoryItem>? categories,
  }) {
    return CategoriesState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }
}
