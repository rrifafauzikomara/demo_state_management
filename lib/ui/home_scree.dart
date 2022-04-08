import 'package:demo_state_management/core/bloc/bloc.dart';
import 'package:demo_state_management/ui/dessert_screen.dart';
import 'package:demo_state_management/ui/seafood_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  final _listWidget = <Widget>[
    const SeafoodScreen(),
    const DessertScreen(),
  ];

  final _bottomNavBarItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.fastfood_rounded),
      label: "Seafood",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.fastfood_rounded),
      label: "Dessert",
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  void _getSeafood(BuildContext context) {
    context.read<MealsBloc>().add(const GetSeafood(name: "Seafood"));
  }

  // void _getDesert(BuildContext context) {
  //   context.read<MealsBloc>().add(const GetDessert(name: "Dessert"));
  // }

  @override
  void initState() {
    super.initState();
    _getSeafood(context);
    // _getDesert(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
