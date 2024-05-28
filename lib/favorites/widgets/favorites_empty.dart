import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/l10n/l10n.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppCard(
            color: AppColors.primary,
            padding: const EdgeInsets.all(AppSpacing.lg),
            borderRadius: BorderRadius.circular(120),
            child: const PhosphorIcon(
              PhosphorIconsDuotone.shoppingCart,
              color: AppColors.primary,
              size: 40,
            ),
          ),
          const SizedBox(height: AppSpacing.xlg),
          Text(
            l10n.favoritesEmptyTitle,
            style: const AppTextStyle.text().xl().bold(),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.favoritesEmptyDescription,
            style: const AppTextStyle.text().sm().medium().withColor(AppColors.gray.shade600),
          ),
          const SizedBox(height: AppSpacing.xlg),
          AppButton.label(
            onPressed: () {
              // context.read<AppCubit>().updateAppBottomNavigationBarItemType(BottomNavigationBarItemType.home);
            },
            label: l10n.startShopping,
            buttonSize: AppButtonSize.medium,
            buttonType: AppButtonType.primary,
          ),
        ],
      ),
    );
  }
}
