import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/addresses/addresses.dart';
import 'package:ylham_motors/auth/auth.dart';
import 'package:ylham_motors/l10n/l10n.dart';
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

        const SizedBox(height: AppSpacing.md),
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.status == AuthenticationStatus.success) {
              return AppCard(
                child: ListTile(
                  leading: const Icon(Icons.person_rounded),
                  title: Text('${state.user?.surname} ${state.user?.name}'),
                  subtitle: Text('+993 ${state.user?.username}'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.logout_rounded),
                  ),
                ),
              );
            } else if (state.status == AuthenticationStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              /// Authentication
              return AppCard(
                onPressed: () {
                  final l10n = context.l10n;
                  Navigator.of(context).push(AuthPage.route());
                },
                padding: EdgeInsets.zero,
                child: ListTile(
                  leading: const PhosphorIcon(PhosphorIconsBold.userCircle),
                  title: Text(context.l10n.login),
                  // subtitle: Text(""),
                  trailing:
                      const PhosphorIcon(PhosphorIconsBold.caretCircleRight),
                ),
              );
            }
          },
        ),

        const SizedBox(height: AppSpacing.md),

        /// Addresses
        AppCard(
          onPressed: () {
            Navigator.of(context).push(AddressesPage.route());
          },
          padding: EdgeInsets.zero,
          child: ListTile(
            leading: const PhosphorIcon(PhosphorIconsBold.mapPin),
            title: Text(context.l10n.addresses),
            trailing: const PhosphorIcon(PhosphorIconsBold.caretCircleRight),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        /// Language
        AppCard(
          onPressed: () {
            showLanguageSelectBottomSheet(context: context);
          },
          padding: EdgeInsets.zero,
          child: ListTile(
            leading: const PhosphorIcon(PhosphorIconsBold.translate),
            title: Text(context.l10n.language),
            trailing: const PhosphorIcon(PhosphorIconsBold.caretCircleRight),
          ),
        ),
      ],
    );
  }
}
