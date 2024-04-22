import 'package:flutter/material.dart';

/// App loading indicator
class AppLoadingIndicator extends StatelessWidget {
  /// App loading indicator
  const AppLoadingIndicator({
    super.key,
    this.isForeground = false,
  });

  /// Option to show loading indicator on the page or above some widget
  final bool isForeground;

  @override
  Widget build(BuildContext context) {
    const indicator = CircularProgressIndicator();

    if (!isForeground) return indicator;

    return SizedBox.expand(
      child: ColoredBox(
        color: Colors.grey.withOpacity(0.15),
        child: indicator,
      ),
    );
  }
}
