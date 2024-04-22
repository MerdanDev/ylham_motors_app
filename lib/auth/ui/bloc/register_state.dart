// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.email = const Email.pure(),
    this.phone = const Phone.pure(),
    this.username = const Username.pure(),
    this.surname = const Surname.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.valid = false,
  });

  final Email email;
  final Phone phone;
  final Username username;
  final Surname surname;

  final FormzSubmissionStatus status;
  final bool valid;

  @override
  List<Object?> get props => [
        email,
        phone,
        username,
        surname,
        status,
        valid,
      ];

  RegisterState copyWith({
    Email? email,
    Phone? phone,
    Username? username,
    Surname? surname,
    FormzSubmissionStatus? status,
    bool? valid,
  }) {
    return RegisterState(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      surname: surname ?? this.surname,
      status: status ?? this.status,
      valid: valid ?? this.valid,
    );
  }
}
