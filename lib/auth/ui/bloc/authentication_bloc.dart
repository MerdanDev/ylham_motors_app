import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/auth/auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthenticationState.initial()) {
    on<AuthenticationVerifyRequested>(_onVerifyRequested);
    on<AuthenticationUserRequested>(_onUserRequested);
    add(AuthenticationUserRequested());
  }

  final AuthRepository _authRepository;

  FutureOr<void> _onVerifyRequested(
    AuthenticationVerifyRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthenticationStatus.loading));

      final response = await _authRepository.verify(AuthVerifyRequestBody(
        phone: event.phone,
        otp: event.otp,
      ));

      emit(state.copyWith(
        status: AuthenticationStatus.success,
        user: response.data,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AuthenticationStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onUserRequested(
    AuthenticationUserRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthenticationStatus.loading));

      final user = await _authRepository.getMe();

      emit(state.copyWith(
        status: AuthenticationStatus.success,
        user: user,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AuthenticationStatus.failure));
      addError(error, stackTrace);
    }
  }
}
