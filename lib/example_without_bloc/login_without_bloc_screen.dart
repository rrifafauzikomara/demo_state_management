import 'package:demo_state_management/utils/validators.dart';
import 'package:flutter/material.dart';

class LoginWithoutBlocScreen extends StatefulWidget {
  const LoginWithoutBlocScreen({Key? key}) : super(key: key);

  @override
  _LoginWithoutBlocScreenState createState() => _LoginWithoutBlocScreenState();
}

class _LoginWithoutBlocScreenState extends State<LoginWithoutBlocScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailCodeFormKey = GlobalKey<FormFieldState>();
  final _passwordFormKey = GlobalKey<FormFieldState>();

  bool _isSubmitButtonEnabled = false;

  void _submitLogin(BuildContext context) {
    print(
      'Login Executed:\n'
      'Email: ${_emailController.text}\n'
      'Password: ${_passwordController.text}',
    );
  }



  bool _isFormValid() {
    return ((_emailCodeFormKey.currentState!.isValid &&
        _passwordFormKey.currentState!.isValid));
  }

  @override
  void initState() {
    super.initState();
    print('First Executed');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _email() {
    print('Build Email Widget');
    return TextFormField(
      key: _emailCodeFormKey,
      controller: _emailController,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email',
        helperText: 'A complete, valid email e.g. joe@gmail.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validators.empty(value),
      onChanged: (value) {
        setState(() {
          _isSubmitButtonEnabled = _isFormValid();
          _emailCodeFormKey.currentState!.validate();
        });
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget _password() {
    print('Build Password Widget');
    return TextFormField(
      key: _passwordFormKey,
      controller: _passwordController,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        helperText:
            'Password should be at least 8 characters with at least one letter and number',
        helperMaxLines: 2,
        labelText: 'Password',
        errorMaxLines: 2,
      ),
      obscureText: true,
      validator: (value) => Validators.empty(value),
      onChanged: (value) {
        setState(() {
          _isSubmitButtonEnabled = _isFormValid();
          _passwordFormKey.currentState!.validate();
        });
      },
      textInputAction: TextInputAction.done,
    );
  }

  Widget _button() {
    print('Build Button Widget');
    return ElevatedButton(
      onPressed: _isSubmitButtonEnabled ? () => _submitLogin(context) : null,
      child: const Text('Submit'),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Build All Widget');
    return Scaffold(
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
    );
  }
}
