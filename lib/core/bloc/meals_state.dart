import 'package:demo_state_management/core/api/api_state.dart';
import 'package:demo_state_management/core/models/meals_response.dart';

class MealsState {
  const MealsState({
    this.statusSeafood = ApiState.initial,
    this.seafoods = const <MealItem>[],
    this.message = '',
  });

  final ApiState statusSeafood;
  final List<MealItem> seafoods;
  final String message;

  MealsState copyWith({
    ApiState? statusSeafood,
    List<MealItem>? seafoods,
    String? message,
  }) {
    return MealsState(
      statusSeafood: statusSeafood ?? this.statusSeafood,
      seafoods: seafoods ?? this.seafoods,
      message: message ?? this.message,
    );
  }
}
