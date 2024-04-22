import 'package:formz/formz.dart';

/// Username Form Input Validation Error
enum UsernameValidationError {
  /// If username is empty
  empty,
}

/// {@template phone}
/// Reusable username form input.
/// {@endtemplate}
class Username extends FormzInput<String, UsernameValidationError> {
  /// {@macro Username}
  const Username.pure() : super.pure('');

  /// {@macro phone}
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;

    return null;
  }
}
