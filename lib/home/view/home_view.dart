import 'package:app_ui/app_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/home/home.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors/products/products.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ylham motors"),
        actions: const [
          HomeSearchAction(),
          // AppContentSelectorAction(),
          SizedBox(width: AppSpacing.md),
        ],
      ),
      body: const HomeContent(),
    );
  }
}

class HomeSearchAction extends StatelessWidget {
  const HomeSearchAction({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(ProductsPage.route());
      },
      icon: const Icon(Icons.search_rounded),
    );
  }
}

class AppContentSelectorAction extends StatelessWidget {
  const AppContentSelectorAction({super.key});

  @override
  Widget build(BuildContext context) {
    final appSource = context.select((AppCubit cubit) => cubit.state.appSource);

    final appSourceText = switch (appSource) {
      AppSource.store => 'Store',
      AppSource.masters => 'Masters',
    };

    // final color = switch (appSource) {
    //   AppSource.store => Colors.deepOrange,
    //   AppSource.masters => Colors.deepPurple,
    // };

    return AppButton.label(
      onPressed: () {
        final toAppSource = appSource == AppSource.masters ? AppSource.store : AppSource.masters;
        context.read<AppCubit>().updateAppSource(toAppSource);
      },
      label: appSourceText,
      buttonSize: AppButtonSize.medium,
      buttonType: AppButtonType.secondary,
      // buttonColor: color,
      trailing: const Icon(Icons.arrow_right_rounded),
    );
  }
}
