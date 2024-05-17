import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turkmen_localization_support/turkmen_localization_support.dart';
import 'package:ylham_motors/addresses/addresses.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/auth/data/repository/auth_repository.dart';
import 'package:ylham_motors/brands/brands.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/categories/categories.dart';
import 'package:ylham_motors/home/home.dart';
import 'package:ylham_motors/l10n/l10n.dart';
import 'package:ylham_motors/language/language.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ylham_motors/navigation/navigation.dart';
import 'package:ylham_motors/products/data/repository/product_repository.dart';
import 'package:ylham_motors/slider/data/repository/slider_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required StreamController<Exception> exceptionStream,
    required SliderRepository sliderRepository,
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
    required BrandRepository brandRepository,
    required AuthRepository authRepository,
    required AddressRepository addressRepository,
    required CartRepository cartRepository,
  })  : _exceptionStream = exceptionStream,
        _sliderRepository = sliderRepository,
        _categoryRepository = categoryRepository,
        _productRepository = productRepository,
        _brandRepository = brandRepository,
        _authRepository = authRepository,
        _addressRepository = addressRepository,
        _cartRepository = cartRepository;

  // ignore: unused_field
  final StreamController<Exception> _exceptionStream;
  final SliderRepository _sliderRepository;
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final BrandRepository _brandRepository;
  final AuthRepository _authRepository;
  final AddressRepository _addressRepository;
  final CartRepository _cartRepository;

  @override
  Widget build(BuildContext context) {
    final appCubit = AppCubit();

    final languageBloc = LanguageBloc();

    final homeBloc = HomeBloc(
      sliderRepository: _sliderRepository,
      categoryRepository: _categoryRepository,
      productRepository: _productRepository,
    )..add(HomeRequested());

    final categoriesBloc = CategoriesBloc(
      categoryRepository: _categoryRepository,
    )..add(const CategoriesRequested());

    final brandsBloc = BrandsBloc(brandRepository: _brandRepository)..add(BrandsRequested());

    final addressBloc = AddressBloc(addressRepository: _addressRepository)..add(AddressesRequested());

    final cartBloc = CartBloc(cartRepository: _cartRepository)..add(CartInitRequested());

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _sliderRepository),
        RepositoryProvider.value(value: _categoryRepository),
        RepositoryProvider.value(value: _productRepository),
        RepositoryProvider.value(value: _brandRepository),
        RepositoryProvider.value(value: _authRepository),
        RepositoryProvider.value(value: _addressRepository),
        RepositoryProvider.value(value: _cartRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: appCubit),
          BlocProvider.value(value: homeBloc),
          BlocProvider.value(value: categoriesBloc),
          BlocProvider.value(value: brandsBloc),
          BlocProvider.value(value: addressBloc),
          BlocProvider.value(value: languageBloc),
          BlocProvider.value(value: cartBloc),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ScreenUtilInit(
              designSize: Size(constraints.maxWidth, constraints.maxHeight),
              builder: (context, constraints) {
                return const AppView();
              },
            );
          },
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.primary,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: const AppTheme().themeData,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        ...TkDelegates.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const BottomNavBar(),
    );
  }
}
