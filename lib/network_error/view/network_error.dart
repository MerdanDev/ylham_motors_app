import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template network_error}
/// A network error alert.
/// {@endtemplate}
class NetworkError extends StatelessWidget {
  /// {@macro network_error}
  const NetworkError({super.key, this.onRetry});

  /// An optional callback which is invoked when the retry button is pressed.
  final VoidCallback? onRetry;

  /// Route constructor to display the widget inside a [Scaffold].
  static Route<void> route({VoidCallback? onRetry}) {
    return PageRouteBuilder<void>(
      pageBuilder: (_, __, ___) => Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: const AppBackButton(),
        ),
        body: Center(
          child: NetworkError(onRetry: onRetry),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    // final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: AppSpacing.xlg),
        Icon(
          Icons.error_outline,
          size: 80,
          color: AppColors.primary[600],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Network Error',
          // l10n.networkError,
          style: const AppTextStyle.text().xl().bold(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxlg),
        //   child:
        AppButton.label(
          label: 'Täzeden synanyş',
          onPressed: onRetry,
          buttonType: AppButtonType.primary,
          textStyle: const AppTextStyle.text().md().semiBold(),
        ),
        // ),
        const SizedBox(height: AppSpacing.xlg),
      ],
    );
  }
}
