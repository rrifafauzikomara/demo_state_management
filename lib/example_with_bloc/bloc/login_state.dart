import 'package:demo_state_management/utils/string_validator.dart';
import 'package:formz/formz.dart';

class LoginState {
  const LoginState({
    this.email = const EmptyValidator.pure(),
    this.password = const EmptyValidator.pure(),
    this.statusLogin = FormzStatus.pure,
    this.message = '',
  });

  final EmptyValidator email;
  final EmptyValidator password;
  final FormzStatus statusLogin;
  final String message;

  LoginState copyWith({
    EmptyValidator? email,
    EmptyValidator? password,
    FormzStatus? statusLogin,
    String? message,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      statusLogin: statusLogin ?? this.statusLogin,
      message: message ?? this.message,
    );
  }
}
