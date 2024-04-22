import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:ylham_motors/auth/auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const RegisterState()) {
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterSurnameChanged>(_onSurnameChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  final AuthRepository _authRepository;

  void _onEmailChanged(RegisterEmailChanged event, Emitter<RegisterState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        valid: Formz.validate([email]),
      ),
    );
  }

  void _onPhoneChanged(RegisterPhoneChanged event, Emitter<RegisterState> emit) {
    final phone = Phone.dirty(event.phone);

    emit(
      state.copyWith(
        phone: phone,
        valid: Formz.validate([phone]),
      ),
    );
  }

  void _onUsernameChanged(RegisterUsernameChanged event, Emitter<RegisterState> emit) {
    final username = Username.dirty(event.username);

    emit(
      state.copyWith(
        username: username,
        valid: Formz.validate([username]),
      ),
    );
  }

  void _onSurnameChanged(RegisterSurnameChanged event, Emitter<RegisterState> emit) {
    final surname = Surname.dirty(event.surname);

    emit(
      state.copyWith(
        surname: surname,
        valid: Formz.validate([surname]),
      ),
    );
  }

  FutureOr<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (!state.valid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.register(
        RegisterRequestBody(
          phone: state.phone.value,
        ),
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }
}
