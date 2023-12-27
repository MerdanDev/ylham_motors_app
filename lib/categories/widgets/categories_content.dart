import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoriesContent extends StatelessWidget {
  const CategoriesContent({super.key});

  /// A function to build a list of sub-categories for a given category
  List<Widget> _buildSubCategories(
    BuildContext context,
    // CategoryModel category,
    // List<SubCategoryModel> subCategories,
  ) {
    return [1, 2, 3]
        .map<Widget>(
          (e) => ListTile(
            onTap: () {},
            style: ListTileStyle.drawer,
            title: const Text('category'),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const VerticalDivider(
                  indent: 3,
                  endIndent: 3,
                  width: 2,
                  // color: COLOR_CONST.primaryColor,
                ),
                const SizedBox(width: 4.0),
                SizedBox.square(
                  dimension: 50,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://plus.unsplash.com/premium_photo-1670934158407-d2009128cb02?q=80&w=1460&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        expandedHeaderPadding: EdgeInsets.zero,
        elevation: 0,
        dividerColor: Colors.transparent,
        children: [1, 2, 3, 4, 5, 6, 7].map<ExpansionPanelRadio>((category) {
          return ExpansionPanelRadio(
            // backgroundColor: Colors.transparent,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                onTap: () {},
                style: ListTileStyle.drawer,
                title: Text('category - $category'),
                leading: SizedBox.square(
                  dimension: 50,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://plus.unsplash.com/premium_photo-1670934158407-d2009128cb02?q=80&w=1460&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            body: Column(
              children: _buildSubCategories(
                context,
                // category,
                // subCategories.where((e) => e.catId == category.id).toList(),
              ),
            ),
            value: category,
          );
        }).toList(),
      ),
    );
  }
}
