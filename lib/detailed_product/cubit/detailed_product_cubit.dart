import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

part 'detailed_product_state.dart';

class DetailedProductCubit extends Cubit<DetailedProductState> {
  DetailedProductCubit({
    required this.product,
  }) : super(DetailedProductInitial());

  final ProductItem product;
}
