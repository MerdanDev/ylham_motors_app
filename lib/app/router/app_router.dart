import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/home/home.dart';
import 'package:ylham_motors/profile/profile.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey();
final GlobalKey<NavigatorState> homeKey = GlobalKey();
final GlobalKey<NavigatorState> cartKey = GlobalKey();
final GlobalKey<NavigatorState> categoriesKey = GlobalKey();
final GlobalKey<NavigatorState> ordersKey = GlobalKey();
final GlobalKey<NavigatorState> profileKey = GlobalKey();

class AppRouter {
  static GoRouter appRouter = GoRouter(
    // navigatorKey: rootKey,
    initialLocation: '/${Routes.homeShellRoute}',
    routes: [
      StatefulShellRoute(
        builder: (context, state, navigationShell) {
          return GestureDetector(
            onTap: () {
              if (FocusManager.instance.primaryFocus != null) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: AppRemovedOverScrollGlow(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: navigationShell,
              ),
            ),
          );
        },
        navigatorContainerBuilder: (context, navigationShell, children) {
          return GestureDetector(
            onTap: () {
              if (FocusManager.instance.primaryFocus != null) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: AppRemovedOverScrollGlow(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: RootView(
                  key: const Key('RootPage_key'),
                  navigationShell: navigationShell,
                  children: children,
                ),
              ),
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${Routes.homeShellRoute}',
                builder: (context, state) {
                  return const HomePage(key: Key('HomePage_key'));
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${Routes.homeShellRoute}',
                builder: (context, state) {
                  return const HomePage(key: Key('HomePage_key'));
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${Routes.homeShellRoute}',
                builder: (context, state) {
                  return const HomePage(key: Key('HomePage_key'));
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${Routes.homeShellRoute}',
                builder: (context, state) {
                  return const HomePage(key: Key('HomePage_key'));
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${Routes.profileShellRoute}',
                builder: (context, state) {
                  return const ProfilePage(key: Key('ProfilePage_key'));
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
