import 'dart:io';

import 'package:data_provider/data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:secure_storage/secure_storage.dart';
import 'package:ylham_motors/addresses/addresses.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/auth/auth.dart';
import 'package:ylham_motors/brands/brands.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/categories/categories.dart';
import 'package:ylham_motors/main/bootstrap/bootstrap.dart';
import 'package:ylham_motors/orders/orders.dart';
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
    // final tokenStorage = InMemoryTokenStorage();
    const secureStorage = FlutterSecureStorage();
    final tokenStorage = SecureTokenStorage(secureStorage: secureStorage);

    // final token = await tokenStorage.readToken();
    if (kDebugMode) {
      tokenStorage.clearToken();
      tokenStorage.saveToken('63|jOy8lcSo7RmsFOp0K5MO6M5GXovEFyWPFQLtoTL2');
      // tokenStorage.saveToken('58|KuJIYk7d9pJjsKKwdG5JUFySFqBepeNo3PxDmZPF');
    }
    // const secureoStorage = SecureStorage();

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
    final categoryRepository =
        CategoryRepository(categoryClient: categoryClient);

    /// Brands
    final brandClient = BrandClient(httpClient: httpClient);
    final brandRepository = BrandRepository(brandClient: brandClient);

    /// Products
    final productClient = ProductClient(httpClient: httpClient);
    final productRepository = ProductRepository(productClient: productClient);

    /// Auth
    final authClient =
        AuthClient(httpClient: httpClient, tokenStorage: tokenStorage);
    final authRepository = AuthRepository(authClient: authClient);

    /// Addresses
    Hive.registerAdapter(AddressModelAdapter());
    final userAddressBox =
        await Hive.openBox<AddressModel>(HiveBoxKeys.userAddresses);
    final addressRepository = AddressRepository(userAddressBox: userAddressBox);

    /// Cart
    final cartClient = CartClient(httpClient: httpClient);
    final cartRepository = CartRepository(cartClient: cartClient);

    /// Orders
    final orderClient = OrderClient(httpClient: httpClient);
    final orderRepository = OrderRepository(orderClient: orderClient);

    return App(
      exceptionStream: exceptionStream,
      sliderRepository: sliderRepository,
      categoryRepository: categoryRepository,
      productRepository: productRepository,
      brandRepository: brandRepository,
      authRepository: authRepository,
      addressRepository: addressRepository,
      cartRepository: cartRepository,
      orderRepository: orderRepository,
    );
  });
}
