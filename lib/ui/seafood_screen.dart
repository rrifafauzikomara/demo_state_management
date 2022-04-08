import 'package:demo_state_management/core/api/api_state.dart';
import 'package:demo_state_management/core/bloc/bloc.dart';
import 'package:demo_state_management/widget/card_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeafoodScreen extends StatefulWidget {
  const SeafoodScreen({Key? key}) : super(key: key);

  @override
  SeafoodState createState() => SeafoodState();
}

class SeafoodState extends State<SeafoodScreen> {
  void _getSeafood(BuildContext context) {
    context.read<MealsBloc>().add(const GetSeafood(name: "Seafood"));
  }

  @override
  void initState() {
    super.initState();
    _getSeafood(context);
  }

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
