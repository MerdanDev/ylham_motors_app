part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginPhoneChanged extends LoginEvent {
  const LoginPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

final class LoginPhoneSubmitted extends LoginEvent {}
