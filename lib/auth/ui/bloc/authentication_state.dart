// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  initial,
  loading,
  success,
  failure,
}

class AuthenticationState extends Equatable {
  const AuthenticationState({
    required this.status,
    this.user,
  });

  const AuthenticationState.initial() : this(status: AuthenticationStatus.initial);

  final AuthenticationStatus status;
  final User? user;

  bool get isAuthenticated => user != null;

  @override
  List<Object?> get props => [status, user];

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    User? user,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
