import 'package:flutter/material.dart';
import 'package:demo_state_management/example_without_bloc/login_without_bloc_screen.dart';
import 'package:demo_state_management/example_with_bloc/ui/login_with_bloc_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //TODO: Change based on needed
      home: const LoginWithoutBlocScreen(),
      // home: const LoginWithBlocScreen(),
    );
  }
}
