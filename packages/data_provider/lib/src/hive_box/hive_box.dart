import 'package:data_provider/data_provider.dart';
import 'package:hive/hive.dart';

/// Hive box keys for the [Hive].
abstract class HiveBoxKeys {
  /// User addresses.
  static const userAddresses = '__user_addresses_key__';
}

/// User adresses box
typedef UserAddressBox = Box<AddressModel>;

// /// Data storage using hive
// class HiveBox {
//   /// Register all adapters & Initialize all boxes
//   static Future<void> initBoxes() async {
//     // Initialize Hive and it's default path

//     // Register hive adapters
//     Hive.registerAdapter(AddressModelAdapter());

//     // Open hive boxes
//     await Hive.openBox<AddressModel>(HiveBoxKeys.userAddresses);
//   }

//   /// Get user addresses stored box
//   static UserAddressBox getUserAddressBox() {
//     return Hive.box<AddressModel>(HiveBoxKeys.userAddresses);
//   }

//   /// Close all open hive boxes
//   static void close() {
//     Hive.close();
//   }
// }
