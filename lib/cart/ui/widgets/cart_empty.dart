import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/l10n/l10n.dart';
import 'package:ylham_motors/navigation/navigation.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppCard(
            color: AppColors.primary.shade200,
            padding: const EdgeInsets.all(AppSpacing.lg),
            borderRadius: BorderRadius.circular(120),
            child: PhosphorIcon(
              PhosphorIconsDuotone.shoppingCart,
              color: AppColors.primary.shade600,
              size: 40,
            ),
          ),
          const SizedBox(height: AppSpacing.xlg),
          Text(
            l10n.cartEmptyTitle,
            style: const AppTextStyle.text().xl().bold(),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.cartEmptyDescription,
            style: const AppTextStyle.text().sm().medium().withColor(AppColors.gray.shade600),
          ),
          const SizedBox(height: AppSpacing.xlg),
          AppButton.label(
            onPressed: () {
              context.read<AppCubit>().updateAppBottomNavigationBarItemType(BottomNavigationBarItemType.home);
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
