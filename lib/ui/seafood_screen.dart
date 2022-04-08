import 'package:demo_state_management/core/api/api_state.dart';
import 'package:demo_state_management/core/bloc/bloc.dart';
import 'package:demo_state_management/widget/card_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeafoodScreen extends StatelessWidget {
  const SeafoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(58, 66, 86, 1.0),
        child: Center(
          child: BlocBuilder<MealsBloc, MealsState>(
            builder: (context, state) {
              if (state.statusSeafood.isLoading) {
                return const CircularProgressIndicator();
              } else if (state.statusSeafood.isError) {
                return Text(state.message);
              } else if (state.statusSeafood.isNoData) {
                return Text(state.message);
              } else if (state.statusSeafood.isHasData) {
                return GridView.builder(
                  itemCount: state.seafoods.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final meal = state.seafoods[index];
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
