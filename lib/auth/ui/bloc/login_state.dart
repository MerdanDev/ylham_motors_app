// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.phone = const Phone.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.valid = false,
  });

  final Phone phone;
  final FormzSubmissionStatus status;
  final bool valid;

  @override
  List<Object?> get props => [phone, status, valid];

  LoginState copyWith({
    Phone? phone,
    FormzSubmissionStatus? status,
    bool? valid,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      status: status ?? this.status,
      valid: valid ?? this.valid,
    );
  }
}
