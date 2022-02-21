import 'package:demo_state_management/core/api/api_service.dart';
import 'package:demo_state_management/core/bloc/bloc.dart';
import 'package:demo_state_management/ui/home_scree.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        create: (context) => MealsBloc(apiService: ApiService(dio: Dio())),
        child: const HomePage(),
      ),
    );
  }
}
