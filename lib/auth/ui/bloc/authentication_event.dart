part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class AuthenticationUserRequested extends AuthenticationEvent {}

final class AuthenticationVerifyRequested extends AuthenticationEvent {
  final String phone;
  final String otp;

  const AuthenticationVerifyRequested({
    required this.phone,
    required this.otp,
  });

  @override
  List<Object> get props => [phone, otp];
}
