import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MastersListView extends StatelessWidget {
  const MastersListView({super.key}) : sliver = false;

  const MastersListView.sliver({super.key}) : sliver = true;

  final bool sliver;

  @override
  Widget build(BuildContext context) {
    const itemCount = 10;
    const padding = EdgeInsets.symmetric(horizontal: AppSpacing.md);

    if (sliver) {
      return SliverPadding(
        padding: padding,
        sliver: SliverList.separated(
          itemCount: itemCount,
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (context, index) => const MasterListTile(),
        ),
      );
    }

    return ListView.separated(
      padding: padding,
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
      itemBuilder: (context, index) => const MasterListTile(),
    );
  }
}

class MasterListTile extends StatelessWidget {
  const MasterListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      tileColor: theme.colorScheme.tertiaryContainer,
      title: Text(
        'Yorunjayev Garynja',
        style: const AppTextStyle.text().sm().semiBold(),
      ),
      subtitle: Text(
        'Bir yerinin bash ussasy',
        style: const AppTextStyle.text().sm().regular(),
      ),
      leading: const CircleAvatar(
        radius: AppSpacing.xxlg,
        backgroundImage: CachedNetworkImageProvider(
          'https://images.unsplash.com/photo-1581833971358-2c8b550f87b3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YW5pbWV8ZW58MHx8MHx8fDA%3D',
        ),
      ),
    );
  }
}
