import 'package:flutter/material.dart';
import 'package:ylham_motors_ui/ylham_motors_ui.dart';

class Product extends StatelessWidget {
  const Product({
    required this.imageUrl,
    required this.title,
    this.onPressed,
    super.key,
  });

  final String imageUrl;
  final String title;

  /// An optional callback which is invoked when the action is triggered.
  /// A [Uri] from the associated [VoidCallback] is provided to the callback.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed?.call(),
      child: ProductDescriptionLayout(
        title: title,
        imageUrl: imageUrl,
        description: "block.description",
        publishedAt: DateTime.now(),
        author: "block.author",
      ),
    );
  }
}
