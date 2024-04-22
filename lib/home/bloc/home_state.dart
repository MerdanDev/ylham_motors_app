// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  populated,
  failure,
}

typedef CategoryProductListMap = Map<int, List<ProductItem>>;

final class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.sliderStatus,
    this.sliders = const [],
    this.categories = const [],
    this.categoryProducts = const {},
  });

  const HomeState.initial()
      : this(
          status: HomeStatus.initial,
          sliderStatus: HomeStatus.loading,
        );

  final HomeStatus status;
  final List<CategoryItem> categories;
  final CategoryProductListMap categoryProducts;

  final HomeStatus sliderStatus;
  final List<SliderItem> sliders;

  @override
  List<Object> get props => [
        status,
        categories,
        categoryProducts,
        sliderStatus,
        sliders,
      ];

  HomeState updateCategoryProducts(int categoryId, List<ProductItem>? products) {
    if (products == null) return this;

    return copyWith(
      categoryProducts: {
        ...categoryProducts,
        categoryId: products,
      },
    );
  }

  HomeState copyWith({
    HomeStatus? status,
    List<CategoryItem>? categories,
    Map<int, List<ProductItem>>? categoryProducts,
    HomeStatus? sliderStatus,
    List<SliderItem>? sliders,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      categoryProducts: categoryProducts ?? this.categoryProducts,
      sliderStatus: sliderStatus ?? this.sliderStatus,
      sliders: sliders ?? this.sliders,
    );
  }
}
