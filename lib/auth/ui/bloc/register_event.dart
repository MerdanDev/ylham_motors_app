part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class RegisterEmailChanged extends RegisterEvent {
  final String email;

  const RegisterEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

final class RegisterPhoneChanged extends RegisterEvent {
  final String phone;

  const RegisterPhoneChanged(this.phone);

  @override
  List<Object> get props => [phone];
}

final class RegisterUsernameChanged extends RegisterEvent {
  final String username;

  const RegisterUsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

final class RegisterSurnameChanged extends RegisterEvent {
  final String surname;

  const RegisterSurnameChanged(this.surname);

  @override
  List<Object> get props => [surname];
}

final class RegisterSubmitted extends RegisterEvent {}
