import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/l10n/l10n.dart';
import 'package:ylham_motors/language/language.dart';

Future<void> showLanguageSelectBottomSheet({
  required BuildContext context,
}) async =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const LanguageSelectBottomSheet(),
    );

class LanguageSelectBottomSheet extends StatelessWidget {
  const LanguageSelectBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xlg,
        vertical: AppSpacing.lg,
      ).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg),
      child: ListView(
        shrinkWrap: true,
        children: [
          /// TITLE
          Text(
            l10n.languageSelectTitle,
            style: const AppTextStyle.display().xs().bold(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xxs),

          /// SUBTITLE
          Text(
            l10n.languageSelectDescription,
            style: const AppTextStyle.text().sm().regular().withColor(Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),

          /// OPTIONS
          ...AppLocalizations.supportedLocales.map(
            (locale) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: AppCard(
                  padding: EdgeInsets.zero,
                  child: CheckboxListTile(
                    onChanged: (value) {
                      if (value ?? false) {
                        context.read<LanguageBloc>().add(LanguageChanged(locale));
                        Navigator.of(context).pop();
                      }
                    },
                    title: Text(switch (locale.languageCode) {
                      'ru' => 'Русский язык',
                      'tk' => 'Türkmen dili',
                      'en' => 'English',
                      _ => '???',
                    }),
                    value: locale.languageCode == context.read<LanguageBloc>().state.languageCode,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
