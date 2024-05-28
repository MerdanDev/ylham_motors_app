import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/products/products.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const FavoritesState.initial()) {
    on<FavoritesInitRequested>(_onInitRequested);
    on<FavoritesRequested>(_onRequested);
    on<FavoritesRefreshRequested>(_onRefreshRequested);
  }

  final ProductRepository _productRepository;

  bool _isFetching = false;

  FutureOr<void> _onRequested(
    FavoritesRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    if (_isFetching || !state.hasMoreContent) return;

    _isFetching = true;

    try {
      emit(state.copyWith(status: FavoritesStatus.loading));

      final response = await _productRepository.getFavorites(
        page: state.page + 1,
      );

      final content = response.data ?? const [];

      emit(state.copyWith(
        status: FavoritesStatus.success,
        products: {...state.products, ...content}.toList(),
        page: state.page + 1,
        hasMoreContent: content.isNotEmpty,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FavoritesStatus.failure));
      addError(error, stackTrace);
    } finally {
      _isFetching = false;
    }
    return null;
  }

  FutureOr<void> _onRefreshRequested(
    FavoritesRefreshRequested event,
    Emitter<FavoritesState> emit,
  ) {
    emit(const FavoritesState.initial());
    add(FavoritesRequested());
  }

  FutureOr<void> _onInitRequested(
    FavoritesInitRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state.status != FavoritesStatus.initial) return;
    add(FavoritesRequested());
  }
}
