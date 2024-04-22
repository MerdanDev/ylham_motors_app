part of 'brands_bloc.dart';

sealed class BrandsEvent extends Equatable {
  const BrandsEvent();

  @override
  List<Object> get props => [];
}

final class BrandsRequested extends BrandsEvent {}
