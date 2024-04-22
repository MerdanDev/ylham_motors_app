import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/categories/categories.dart';
import 'package:ylham_motors/home/home.dart';
import 'package:ylham_motors/masters/masters.dart';
import 'package:ylham_motors/detailed_product/detailed_product.dart';
import 'package:ylham_motors/products/products.dart';
import 'package:ylham_motors_ui/ylham_motors_ui.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final appSource = context.select((AppCubit cubit) => cubit.state.appSource);
    final sliders = context.select((HomeBloc bloc) => bloc.state.sliders);
    final categories = context.select((HomeBloc bloc) => bloc.state.categories);
    final categoryProducts = context.select((HomeBloc bloc) => bloc.state.categoryProducts);
    final isLoading = context.select((HomeBloc bloc) => bloc.state.status == HomeStatus.loading);

    final categoryWidgets = categories.map((category) {
      final products = categoryProducts[category.id!];

      if (products?.isEmpty ?? true) {
        return const SliverPadding(padding: EdgeInsets.zero);
      }

      return SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: CategoriesItemCard(category: category),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width - (AppSpacing.md * 1.5),
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.md),
                scrollDirection: Axis.horizontal,
                itemCount: products!.length,
                separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return AspectRatio(
                    aspectRatio: 0.51,
                    child: ProductCard(
                      product: product,
                      onPressed: () => Navigator.of(context).push(
                        DetailedProductPage.route(
                          product: product,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });

    return CustomScrollView(
      slivers: [
        if (sliders.isNotEmpty)
          SliverToBoxAdapter(
            child: BannerAdsSlider(
              imageUrls: sliders.map<String?>((e) => e.image).nonNulls,
            ),
          )
        else
          const SliverToBoxAdapter(
            child: SizedBox(height: AppSpacing.md),
          ),

        /// Store products
        if (appSource == AppSource.store) ...[
          if (isLoading)
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: AppSpacing.md),
                  CircularProgressIndicator(),
                ],
              ),
            ),

          /// Category products
          ...categoryWidgets,

          // ProductGrid(
          //   productsLength: 10,
          //   onPressed: () {
          //     Navigator.of(context).push(DetailedProductPage.route());
          //   },
          // ),
        ],

        /// Masters
        if (appSource == AppSource.masters) ...[
          const MastersListView.sliver(),
        ],
      ],
    );
  }
}
