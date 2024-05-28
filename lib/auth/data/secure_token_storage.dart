import 'package:data_provider/data_provider.dart';
import 'package:secure_storage/secure_storage.dart';

class SecureTokenStorage extends TokenStorage {
  SecureTokenStorage({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  static const _key = '__api_token__';

  @override
  Future<void> clearToken() => _secureStorage.delete(key: _key);

  @override
  Future<String?> readToken() => _secureStorage.read(key: _key);

  @override
  Future<void> saveToken(String token) => _secureStorage.write(key: _key, value: token);
}
