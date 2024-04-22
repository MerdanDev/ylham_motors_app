import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:ylham_motors/addresses/addresses.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/auth/auth.dart';
import 'package:ylham_motors/brands/brands.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/categories/categories.dart';
import 'package:ylham_motors/main/bootstrap/bootstrap.dart';
import 'package:data_provider/data_provider.dart';
import 'package:ylham_motors/products/products.dart';
import 'package:ylham_motors/slider/slider.dart';

void main() {
  bootstrap(({
    // firebaseMessaging,
    required sharedPreferences,
    required exceptionStream,
  }) async {
    /// Constants
    // const defaultLanguage = 'en';
    const defaultBaseUrl = 'http://216.250.12.89/api/v1'; // Env.serverUrl;

    /// Storages
    final tokenStorage = InMemoryTokenStorage();
    // const secureStorage = FlutterSecureStorage();
    if (kDebugMode) {
      tokenStorage.saveToken('55|Hh9SkgxCemrqWabOCPQ9iBJTUGuExBqANNBjEyTs');
      // tokenStorage.saveToken('3|QfjdffhsoR24Qa1bloRtzWWesTW5Wq2kpl2ia7Ga');
    }
    // const secureStorage = SecureStorage();

    /// intialization of package_info
    // final packageInfo = await PackageInfo.fromPlatform();

    /// HTTP Client
    final httpClient = Http(
      enableLogger: kDebugMode,
      defaultBaseUrl: defaultBaseUrl,
      tokenProvider: tokenStorage.readToken,
      languageProvider: () async => 'tm',
      // languageProvider: settingsStorage.fetchAppLanguage,
    );

    /// Only for development
    HttpOverrides.global = MyHttpOverrides();

    /// Sliders
    final sliderClient = SliderClient(httpClient: httpClient);
    final sliderRepository = SliderRepository(sliderClient: sliderClient);

    /// Categories
    final categoryClient = CategoryClient(httpClient: httpClient);
    final categoryRepository = CategoryRepository(categoryClient: categoryClient);

    /// Brands
    final brandClient = BrandClient(httpClient: httpClient);
    final brandRepository = BrandRepository(brandClient: brandClient);

    /// Products
    final productClient = ProductClient(httpClient: httpClient);
    final productRepository = ProductRepository(productClient: productClient);

    /// Auth
    final authClient = AuthClient(httpClient: httpClient);
    final authRepository = AuthRepository(authClient: authClient);

    /// Addresses
    Hive.registerAdapter(AddressModelAdapter());
    final userAddressBox = await Hive.openBox<AddressModel>(HiveBoxKeys.userAddresses);
    final addressRepository = AddressRepository(userAddressBox: userAddressBox);

    /// Cart
    final cartClient = CartClient(httpClient: httpClient);
    final cartRepository = CartRepository(cartClient: cartClient);

    return App(
      exceptionStream: exceptionStream,
      sliderRepository: sliderRepository,
      categoryRepository: categoryRepository,
      productRepository: productRepository,
      brandRepository: brandRepository,
      authRepository: authRepository,
      addressRepository: addressRepository,
      cartRepository: cartRepository,
    );
  });
}
