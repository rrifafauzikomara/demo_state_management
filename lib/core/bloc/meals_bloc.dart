import 'package:demo_state_management/core/api/api_service.dart';
import 'package:demo_state_management/core/api/api_state.dart';
import 'package:demo_state_management/core/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final ApiService apiService;

  MealsBloc({required this.apiService}) : super(const MealsState());

  @override
  Stream<MealsState> mapEventToState(MealsEvent event) async* {
    if (event is GetSeafood) {
      yield* _fetchAllMeals("Seafood");
    }
    //TODO: add for "Dessert"
  }

  Stream<MealsState> _fetchAllMeals(String category) async* {
    yield state.copyWith(statusSeafood: ApiState.loading, message: "Loading");

    try {
      final response = await apiService.fetchAllMeals(category);

      if (response.meals.isEmpty) {
        yield state.copyWith(
          statusSeafood: ApiState.noData,
          message: "No Data",
        );
      } else {
        yield state.copyWith(
          statusSeafood: ApiState.hasData,
          meals: response.meals,
        );
      }
    } catch (e) {
      yield state.copyWith(
        statusSeafood: ApiState.error,
        message: e.toString(),
      );
    }
  }
}
