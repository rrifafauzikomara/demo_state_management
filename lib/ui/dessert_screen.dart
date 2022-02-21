import 'package:flutter/material.dart';

class DessertScreen extends StatefulWidget {
  const DessertScreen({Key? key}) : super(key: key);

  @override
  DessertState createState() => DessertState();
}

class DessertState extends State<DessertScreen> {
  void _getDesert(BuildContext context) {}

  @override
  void initState() {
    _getDesert(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(58, 66, 86, 1.0),
        child: const Center(
          child: Text('TODO'),
        ),
      ),
    );
  }
}
