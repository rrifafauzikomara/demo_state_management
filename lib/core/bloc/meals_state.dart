import 'package:demo_state_management/core/api/api_state.dart';
import 'package:demo_state_management/core/models/meals_response.dart';

class MealsState {
  const MealsState({
    this.statusSeafood = ApiState.initial,
    this.meals = const <MealItem>[],
    this.message = '',
  });

  final ApiState statusSeafood;
  final List<MealItem> meals;
  final String message;

  MealsState copyWith({
    ApiState? statusSeafood,
    List<MealItem>? meals,
    String? message,
  }) {
    return MealsState(
      statusSeafood: statusSeafood ?? this.statusSeafood,
      meals: meals ?? this.meals,
      message: message ?? this.message,
    );
  }
}
