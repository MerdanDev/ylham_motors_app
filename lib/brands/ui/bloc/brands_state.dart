// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'brands_bloc.dart';

enum BrandsStatus {
  initial,
  loading,
  populated,
  failure,
}

final class BrandsState extends Equatable {
  const BrandsState({
    required this.status,
    this.brands = const [],
  });

  const BrandsState.initial() : this(status: BrandsStatus.initial);

  final BrandsStatus status;
  final List<BrandItem> brands;

  @override
  List<Object> get props => [
        status,
        brands,
      ];

  BrandsState copyWith({
    BrandsStatus? status,
    List<BrandItem>? brands,
  }) {
    return BrandsState(
      status: status ?? this.status,
      brands: brands ?? this.brands,
    );
  }
}
