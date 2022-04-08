import 'package:demo_state_management/core/api/api_state.dart';
import 'package:demo_state_management/core/bloc/bloc.dart';
import 'package:demo_state_management/widget/card_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DessertScreen extends StatelessWidget {
  const DessertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(58, 66, 86, 1.0),
        child: Center(
          child: BlocBuilder<MealsBloc, MealsState>(
            builder: (context, state) {
              if (state.statusDessert.isLoading) {
                return const CircularProgressIndicator();
              } else if (state.statusDessert.isError) {
                return Text(state.message);
              } else if (state.statusDessert.isNoData) {
                return Text(state.message);
              } else if (state.statusDessert.isHasData) {
                return GridView.builder(
                  itemCount: state.desserts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final meal = state.desserts[index];
                    return CardMeal(
                      imageUrl: meal.strMealThumb ?? '',
                      title: meal.strMeal ?? '',
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
