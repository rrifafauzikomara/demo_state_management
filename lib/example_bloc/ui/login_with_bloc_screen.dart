import 'package:demo_state_management/example_bloc/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginWithBlocScreen extends StatelessWidget {
  const LoginWithBlocScreen({Key? key}) : super(key: key);

  void _submitLogin(BuildContext context) {
    context.read<LoginBloc>().add(ValidateLogin());
  }

  Widget _email() {
    print('Build Email Widget');
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        print('Build BLoC Email Widget');
        final email = state.email.value;
        final errorText = state.email.validator(email);
        return TextFormField(
          initialValue: email,
          decoration: InputDecoration(
            icon: const Icon(Icons.email),
            labelText: 'Email',
            helperText: 'A complete, valid email e.g. joe@gmail.com',
            errorText: errorText,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  Widget _password() {
    print('Build Password Widget');
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        print('Build BLoC Password Widget');
        final password = state.password.value;
        final errorText = state.password.validator(password);
        return TextFormField(
          initialValue: password,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            helperText:
                'Password should be at least 8 characters with at least one letter and number',
            helperMaxLines: 2,
            labelText: 'Password',
            errorMaxLines: 2,
            errorText: errorText,
          ),
          obscureText: true,
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }

  Widget _button() {
    print('Build Button Widget');
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        print('Build BLoC Button Widget');
        return ElevatedButton(
          onPressed: state.statusLogin.isValidated
              ? () => _submitLogin(context)
              : null,
          child: const Text('Submit'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Build All Widget');
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.statusLogin.isSubmissionSuccess) {
            print('Login Success');
          }
          if (state.statusLogin.isSubmissionInProgress) {
            print('Login In Progress');
          }
          if (state.statusLogin.isSubmissionFailure) {
            print('Login Failed');
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Flutter Login Form')),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _email(),
                _password(),
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
