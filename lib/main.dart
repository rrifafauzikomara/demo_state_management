import 'package:flutter/material.dart';
import 'package:demo_state_management/example_without_bloc/login_without_bloc_screen.dart';
import 'package:demo_state_management/example_bloc/ui/login_with_bloc_screen.dart';

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
      home: const DefaultScreen(title: 'Flutter Demo'),
      // home: const LoginWithoutBlocScreen(),
      // home: const LoginWithBlocScreen(),
    );
  }
}

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
