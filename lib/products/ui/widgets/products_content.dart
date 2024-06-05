import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ylham_motors/products/products.dart';

class ProductsContent extends StatelessWidget {
  const ProductsContent({super.key});

  Widget _buildHeader(BuildContext context) {
    final category = context.read<ProductsBloc>().category;
    final brand = context.read<ProductsBloc>().brand;
    final headerText = [category?.name, brand?.name].nonNulls.join(' / ');

    if (headerText.isNotEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md).copyWith(bottom: 0),
          child: AppCard(
            child: Text(
              headerText,
              style: const AppTextStyle.text().xs().semiBold(),
            ),
          ),
        ),
      );
    }

    return const SliverToBoxAdapter(child: SizedBox());
  }

  @override
  Widget build(BuildContext context) {
    final (products, hasMoreContent) = context.select(
      (ProductsBloc bloc) => (bloc.state.products, bloc.state.hasMoreContent),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        /// ITEMS
        CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
            const ProductSearchField(),
            _buildHeader(context),
            ProductGridView(
              products: products,
              hasMoreContent: hasMoreContent,
              onLoadMore: () => context.read<ProductsBloc>().add(ProductsRequested()),
            )
          ],
        ),

        /// EMPTY HANDLE
        if (products.isEmpty && !hasMoreContent) const ProductsEmpty(),
      ],
    );
  }
}

class ProductSearchField extends HookWidget {
  const ProductSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    // final isSearchEmpty = context.select((ProductsBloc bloc) => bloc.state.search?.isEmpty ?? true);

    final isSearchEmpty = useState(true);
    final controller = useSearchController();

    final shape = WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
    );

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: SearchAnchor(
          searchController: controller,
          viewShape: shape.value,
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              backgroundColor: WidgetStatePropertyAll(AppColors.primary.shade100),
              elevation: const WidgetStatePropertyAll(0),
              shape: shape,
              padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                // controller.openView();
              },
              onChanged: (String value) {
                context.read<ProductsBloc>().add(ProductsSearchUpdated(value));
                isSearchEmpty.value = value.isEmpty;
                // controller.openView();
              },
              leading: const Icon(Icons.search),
              trailing: <Widget>[
                if (!isSearchEmpty.value)
                  Tooltip(
                    message: 'Clear search',
                    child: IconButton(
                      onPressed: () {
                        controller.clear();
                        context.read<ProductsBloc>().add(const ProductsSearchUpdated(''));
                        isSearchEmpty.value = true;
                      },
                      icon: const Icon(Icons.clear_rounded),
                    ),
                  )
              ],
            );
          },
          suggestionsBuilder: (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  controller.closeView(item);
                },
              );
            });
          },
        ),
      ),
    );
  }
}
