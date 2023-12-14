import 'package:flutter/material.dart';

/// Removes Over scroll glow when scrolling
class AppRemovedOverScrollGlow extends StatelessWidget {
  /// AppRemovedOverScrollGlow constructor
  const AppRemovedOverScrollGlow({
    required Widget child,
    super.key,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: _RemovedOverscrollGlowConfig(),
      child: _child,
    );
  }
}

class _RemovedOverscrollGlowConfig extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
