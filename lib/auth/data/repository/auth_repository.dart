import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the Brand repository failures
abstract class AuthFailure with EquatableMixin implements Exception {
  const AuthFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class LoginFailure extends AuthFailure {
  const LoginFailure(super.error);
}

class RegisterFailure extends AuthFailure {
  const RegisterFailure(super.error);
}

class AuthVerifyFailure extends AuthFailure {
  const AuthVerifyFailure(super.error);
}

class AuthRepository {
  const AuthRepository({
    required AuthClient authClient,
  }) : _authClient = authClient;

  final AuthClient _authClient;

  Future<dynamic> login(LoginRequestBody body) async {
    try {
      return await _authClient.login(body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LoginFailure(error), stackTrace);
    }
  }

  Future<dynamic> register(RegisterRequestBody body) async {
    try {
      return await _authClient.register(body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(RegisterFailure(error), stackTrace);
    }
  }

  Future<bool> verify(AuthVerifyRequestBody body) async {
    try {
      return await _authClient.verify(body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthVerifyFailure(error), stackTrace);
    }
  }
}
