import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors_ui/ylham_motors_ui.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        'https://plus.unsplash.com/premium_photo-1682308249776-9356bf43b705?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YW5pbWV8ZW58MHx8MHx8fDA%3D';
    const description = 'Lorem ipsum doler sit, description';
    const title = 'Erkekler uchin shorty';
    const price = '360.0 m.';
    const isLiked = false;

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(AppSpacing.md),
              ),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(AppSpacing.md),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (_, __, progress) => CircularProgressIndicator(value: progress.progress),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            /// Title
            Text(
              title,
              style: const AppTextStyle.text().lg().bold(),
            ),

            const SizedBox(height: AppSpacing.md),

            /// Price & actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    price,
                    style: const AppTextStyle.text().lg().bold(),
                  ),
                ),

                /// Actions
                Expanded(
                  flex: 10,
                  child: ProductFooter(
                    onCart: () {},
                    onLike: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),

            /// Properties
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.md),
              clipBehavior: Clip.hardEdge,
              child: ColoredBox(
                color: Colors.blueGrey.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    separatorBuilder: (context, index) => const Divider(color: Colors.white),
                    itemBuilder: (context, index) => Row(
                      children: [
                        Expanded(
                          flex: 50,
                          child: Text(
                            'key_$index:',
                            style: const AppTextStyle.text().xs().semiBold(),
                          ),
                        ),
                        Expanded(
                          flex: 50,
                          child: Text(
                            'property_value_$index',
                            style: const AppTextStyle.text().xs(),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
