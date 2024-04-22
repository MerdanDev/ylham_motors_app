import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/addresses/addresses.dart';
import 'package:ylham_motors/auth/auth.dart';
import 'package:ylham_motors/language/language.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        // /// Profile data || Auth
        // AppButton.label(
        //   onPressed: () => Navigator.of(context).push(AuthPage.route()),
        //   label: "Authentication",
        //   leading: const PhosphorIcon(PhosphorIconsBold.userCircle),
        // ),

        // const SizedBox(height: AppSpacing.md),

        /// Authentication
        AppCard(
          onPressed: () {
            Navigator.of(context).push(AuthPage.route());
          },
          padding: EdgeInsets.zero,
          child: const ListTile(
            leading: PhosphorIcon(PhosphorIconsBold.userCircle),
            title: Text("Agza bol"),
            // subtitle: Text(""),
            trailing: PhosphorIcon(PhosphorIconsBold.caretCircleRight),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        /// Addresses
        AppCard(
          onPressed: () {
            Navigator.of(context).push(AddressesPage.route());
          },
          padding: EdgeInsets.zero,
          child: const ListTile(
            leading: PhosphorIcon(PhosphorIconsBold.mapPin),
            title: Text("Salgylarym"),
            trailing: PhosphorIcon(PhosphorIconsBold.caretCircleRight),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        /// Language
        AppCard(
          onPressed: () {
            showLanguageSelectBottomSheet(context: context);
          },
          padding: EdgeInsets.zero,
          child: const ListTile(
            leading: PhosphorIcon(PhosphorIconsBold.translate),
            title: Text("Dil"),
            trailing: PhosphorIcon(PhosphorIconsBold.caretCircleRight),
          ),
        ),
      ],
    );
  }
}
