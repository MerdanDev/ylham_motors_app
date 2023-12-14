import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image
              AspectRatio(
                aspectRatio: 2 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1581833971358-2c8b550f87b3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YW5pbWV8ZW58MHx8MHx8fDA%3D',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // CachedNetworkImage(
              //   imageUrl: 'https://tmcars.info/tmcars/images/original/2023/07/27/20/19/1eacf80c-1009-4437-bd20-78d7e1aacc37.jpg',
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),

              // Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Erkekler üçin şorty', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 8.0),
                  Text('Gapdal we yz tarapyndan jübüli ýumşak şorty', style: theme.textTheme.bodySmall),
                  const SizedBox(height: 8.0),
                  Text('360,00 m.', style: theme.textTheme.titleMedium),
                ],
              ),

              // Footer
              Row(
                children: [
                  // Favorite icon button
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_rounded),
                  ),

                  // Add to cart icon button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text("cart"),
                      icon: const Icon(Icons.shopping_cart_rounded),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
