import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/categories/categories.dart';
import 'package:ylham_motors/products/products.dart';
import 'package:ylham_motors/slider/slider.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required SliderRepository sliderRepository,
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
  })  : _sliderRepository = sliderRepository,
        _categoryRepository = categoryRepository,
        _productRepository = productRepository,
        super(const HomeState.initial()) {
    on<HomeRequested>(_onHomeRequested);
    on<HomeSlidersRequested>(_onHomeSlidersRequested);
  }

  final SliderRepository _sliderRepository;
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  FutureOr<void> _onHomeRequested(
    HomeRequested event,
    Emitter<HomeState> emit,
  ) async {
    add(HomeSlidersRequested());

    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final response = await _categoryRepository.getCategories();

      final categories = response.data;

      CategoryProductListMap map = {};

      if (categories != null) {
        await Future.wait(categories.map((category) async {
          final response = await _productRepository.getProducts(GetProductListQueryParameters(
            categoryId: category.id!,
          ));

          map[category.id!] = response.data ?? const [];
        }));
      }

      emit(state.copyWith(
        status: HomeStatus.populated,
        categories: response.data,
        categoryProducts: map,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: HomeStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onHomeSlidersRequested(
    HomeSlidersRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(sliderStatus: HomeStatus.loading));
      final response = await _sliderRepository.getSliders();
      emit(state.copyWith(
        sliderStatus: HomeStatus.populated,
        sliders: response.data,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(sliderStatus: HomeStatus.failure));
      addError(error, stackTrace);
    }
  }
}
