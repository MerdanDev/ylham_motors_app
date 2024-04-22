import 'package:formz/formz.dart';

/// Phone Form Input Validation Error
enum PhoneValidationError {
  /// If phone is empty
  empty,

  /// Phone is invalid (generic validation error)
  invalid
}

/// {@template phone}
/// Reusable phone form input.
/// {@endtemplate}
class Phone extends FormzInput<String, PhoneValidationError> {
  /// {@macro phone}
  const Phone.pure() : super.pure('');

  /// {@macro phone}
  const Phone.dirty([super.value = '']) : super.dirty();

  @override
  PhoneValidationError? validator(String value) {
    if (value.isEmpty) return PhoneValidationError.empty;
    return value.length == 8 ? null : PhoneValidationError.invalid;
  }
}
