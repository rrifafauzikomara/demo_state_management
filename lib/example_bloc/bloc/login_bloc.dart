import 'package:demo_state_management/example_bloc/bloc/bloc.dart';
import 'package:demo_state_management/utils/string_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ValidateLogin>(_onValidate);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = EmptyValidator.dirty(event.email);
    emit(state.copyWith(
      email: email.valid ? email : EmptyValidator.pure(event.email),
      statusLogin: Formz.validate([
        email,
        state.password,
      ]),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = EmptyValidator.dirty(event.password);
    emit(state.copyWith(
      password: password.valid ? password : EmptyValidator.pure(event.password),
      statusLogin: Formz.validate([
        password,
        state.email,
      ]),
    ));
  }

  Future<void> _onValidate(
      ValidateLogin event, Emitter<LoginState> emit) async {
    final email = EmptyValidator.dirty(state.email.value);
    final password = EmptyValidator.dirty(state.password.value);
    emit(state.copyWith(
      email: email,
      password: password,
      statusLogin: Formz.validate([email, password]),
    ));

    try {
      if (state.statusLogin.isValidated) {
        emit(state.copyWith(statusLogin: FormzStatus.submissionInProgress));
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(state.copyWith(statusLogin: FormzStatus.submissionSuccess));
      }
    } catch (_) {
      emit(state.copyWith(statusLogin: FormzStatus.submissionFailure));
    }
  }
}
