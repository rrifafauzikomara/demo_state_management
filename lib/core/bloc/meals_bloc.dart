import 'package:demo_state_management/core/api/api_service.dart';
import 'package:demo_state_management/core/api/api_state.dart';
import 'package:demo_state_management/core/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final ApiService apiService;

  MealsBloc({required this.apiService}) : super(const MealsState()) {
    on<GetSeafood>(_fetchAllSeafoods);
    // on<GetDessert>(_fetchAllDesserts);
  }

  Future<void> _fetchAllSeafoods(
    GetSeafood event,
    Emitter<MealsState> emit,
  ) async {
    emit(state.copyWith(statusSeafood: ApiState.loading, message: "Loading"));

    try {
      final response = await apiService.fetchAllMeals(event.name);

      if (response.meals.isEmpty) {
        emit(state.copyWith(
          statusSeafood: ApiState.noData,
          message: "No Data",
        ));
      } else {
        emit(state.copyWith(
          statusSeafood: ApiState.hasData,
          seafoods: response.meals,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        statusSeafood: ApiState.error,
        message: e.toString(),
      ));
    }
  }

  // Future<void> _fetchAllDesserts(
  //   GetDessert event,
  //   Emitter<MealsState> emit,
  // ) async {
  //   emit(state.copyWith(statusDessert: ApiState.loading, message: "Loading"));
  //
  //   try {
  //     final response = await apiService.fetchAllMeals(event.name);
  //
  //     if (response.meals.isEmpty) {
  //       emit(state.copyWith(
  //         statusDessert: ApiState.noData,
  //         message: "No Data",
  //       ));
  //     } else {
  //       emit(state.copyWith(
  //         statusDessert: ApiState.hasData,
  //         desserts: response.meals,
  //       ));
  //     }
  //   } catch (e) {
  //     emit(state.copyWith(
  //       statusDessert: ApiState.error,
  //       message: e.toString(),
  //     ));
  //   }
  // }
}
