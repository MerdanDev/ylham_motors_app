import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/favorites/favorites.dart';

class FavoritesRefreshIndicator extends StatelessWidget {
  const FavoritesRefreshIndicator({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final bloc = context.read<FavoritesBloc>();
        bloc.add(FavoritesRefreshRequested());
        while ((await bloc.stream.first).status == FavoritesStatus.loading) {}
      },
      child: child,
    );
  }
}
