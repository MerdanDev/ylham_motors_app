// import 'package:data_provider/data_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ylham_motors/detailed_product/detailed_product.dart';
// import 'package:ylham_motors/navigation/navigation.dart';
// import 'package:ylham_motors/products/products.dart';

// final GoRouter appRouter = GoRouter(
//   debugLogDiagnostics: true,
//   initialLocation: GoRouteNames.main,
//   routes: [
//     // GoRoute(
//     //   path: GoRouteNames.splash,
//     //   builder: (context, state) {
//     //     return const SplashPage();
//     //   },
//     // ),
//     GoRoute(
//       path: GoRouteNames.main,
//       builder: (context, state) {
//         return const BottomNavBar();
//       },
//       routes: [
//         GoRoute(
//           name: GoRouteNames.detailedProduct,
//           path: GoRouteNames.detailedProduct.replaceFirst('/', ''),
//           builder: (context, state) {
//             final product = state.extra as ProductItem;
//             return DetailedProductPage(product: product);
//           },
//         ),
//         GoRoute(
//           name: GoRouteNames.products,
//           path: GoRouteNames.products.replaceFirst('/', ''),
//           builder: (context, state) {
//             return const ProductsPage();
//           },
//           routes: [
//             GoRoute(
//               name: GoRouteNames.detailedProduct,
//               path: GoRouteNames.detailedProduct.replaceFirst('/', ''),
//               builder: (context, state) {
//                 final slug = state.extra as String;
//                 return DetailedPlacePage(slug: slug);
//               },
//             ),
//           ],
//         ),
//         // GoRoute(
//         //   name: GoRouteNames.detailedProduct,
//         //   path: GoRouteNames.detailedProduct.replaceFirst('/', ''),
//         //   builder: (context, state) {
//         //     return const DetailedPlacePage();
//         //   },
//         // ),
//       ],
//     ),
//   ],
// );

// // final appRouterProvider = Provider<GoRouter>.value(value: appRouter);

// abstract class GoRouteNames {
//   static const String splash = '/splash';
//   static const String main = '/';
//   static const String products = '/products';
//   static const String detailedProduct = '/detailed_product';
// }

// abstract mixin class AppRouterContext {
//   BuildContext? get appContext => appRouter.routerDelegate.navigatorKey.currentContext;
// }
