import 'package:formz/formz.dart';

/// Surname Form Input Validation Error
enum SurnameValidationError {
  /// If surname is empty
  empty,
}

/// {@template phone}
/// Reusable surname form input.
/// {@endtemplate}
class Surname extends FormzInput<String, SurnameValidationError> {
  /// {@macro Surname}
  const Surname.pure() : super.pure('');

  /// {@macro phone}
  const Surname.dirty([super.value = '']) : super.dirty();

  @override
  SurnameValidationError? validator(String value) {
    if (value.isEmpty) return SurnameValidationError.empty;

    return null;
  }
}
