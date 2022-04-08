import 'package:demo_state_management/core/api/api_state.dart';
import 'package:demo_state_management/core/models/meals_response.dart';

class MealsState {
  const MealsState({
    this.statusSeafood = ApiState.initial,
    // this.statusDessert = ApiState.initial,
    this.seafoods = const <MealItem>[],
    // this.desserts = const <MealItem>[],
    this.message = '',
  });

  final ApiState statusSeafood;
  // final ApiState statusDessert;
  final List<MealItem> seafoods;
  // final List<MealItem> desserts;
  final String message;

  MealsState copyWith({
    ApiState? statusSeafood,
    // ApiState? statusDessert,
    List<MealItem>? seafoods,
    // List<MealItem>? desserts,
    String? message,
  }) {
    return MealsState(
      statusSeafood: statusSeafood ?? this.statusSeafood,
      // statusDessert: statusDessert ?? this.statusDessert,
      seafoods: seafoods ?? this.seafoods,
      // desserts: desserts ?? this.desserts,
      message: message ?? this.message,
    );
  }
}
