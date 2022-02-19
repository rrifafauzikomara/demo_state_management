import 'package:demo_state_management/example_bloc/bloc/bloc.dart';
import 'package:demo_state_management/utils/string_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      final email = EmptyValidator.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : EmptyValidator.pure(event.email),
        statusLogin: Formz.validate([
          email,
          state.password,
        ]),
      );
    } else if (event is PasswordChanged) {
      final password = EmptyValidator.dirty(event.password);
      yield state.copyWith(
        password:
            password.valid ? password : EmptyValidator.pure(event.password),
        statusLogin: Formz.validate([
          password,
          state.email,
        ]),
      );
    } else if (event is ValidateLogin) {
      yield* _validate();
    }
  }

  Stream<LoginState> _validate() async* {
    final email = EmptyValidator.dirty(state.email.value);
    final password = EmptyValidator.dirty(state.password.value);
    yield state.copyWith(
      email: email,
      password: password,
      statusLogin: Formz.validate([email, password]),
    );

    try {
      if (state.statusLogin.isValidated) {
        yield state.copyWith(statusLogin: FormzStatus.submissionInProgress);
        await Future<void>.delayed(const Duration(seconds: 1));
        yield state.copyWith(statusLogin: FormzStatus.submissionSuccess);
      }
    } catch (_) {
      yield state.copyWith(statusLogin: FormzStatus.submissionFailure);
    }
  }
}
