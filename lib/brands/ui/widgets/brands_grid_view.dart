import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/brands/brands.dart';
import 'package:ylham_motors/products/products.dart';

class BrandsGridView extends StatelessWidget {
  const BrandsGridView({
    super.key,
    bool sliver = false,
  }) : _sliver = sliver;

  const BrandsGridView.sliver({Key? key}) : this(key: key, sliver: true);

  final bool _sliver;

  Widget? itemBuilder(BuildContext context, List<BrandItem> brands, int index) {
    final brand = brands[index];

    return BrandItemCard(
      brand: brand,
      onPressed: () {
        Navigator.of(context).push(
          ProductsPage.route(
            brand: brand,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final brands = context.select((BrandsBloc bloc) => bloc.state.brands);

    /// GRID DELEGATE
    const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: AppSpacing.md,
      crossAxisSpacing: AppSpacing.md,
    );

    const padding = EdgeInsets.all(AppSpacing.md);

    /// SLIVER GRID
    if (_sliver) {
      return SliverPadding(
        padding: padding,
        sliver: SliverGrid.builder(
          gridDelegate: gridDelegate,
          itemCount: brands.length,
          itemBuilder: (context, index) => itemBuilder(context, brands, index),
        ),
      );
    }

    /// NORMAL GRID VIEW
    return GridView.builder(
      padding: padding,
      gridDelegate: gridDelegate,
      itemCount: brands.length,
      itemBuilder: (context, index) => itemBuilder(context, brands, index),
    );
  }
}
