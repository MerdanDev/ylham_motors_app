import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/brands/brands.dart';

part 'brands_event.dart';
part 'brands_state.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  BrandsBloc({
    required BrandRepository brandRepository,
  })  : _brandRepository = brandRepository,
        super(const BrandsState.initial()) {
    on<BrandsRequested>(_onBrandsRequested);
  }

  final BrandRepository _brandRepository;

  FutureOr<void> _onBrandsRequested(
    BrandsRequested event,
    Emitter<BrandsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BrandsStatus.loading));
      final response = await _brandRepository.getCategories();
      emit(state.copyWith(
        status: BrandsStatus.populated,
        brands: response.data,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: BrandsStatus.initial));
      addError(error, stackTrace);
    }
  }
}
