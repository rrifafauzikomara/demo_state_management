import 'package:demo_state_management/core/models/meals_response.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<MealsResponse> fetchAllMeals(String category) async {
    final response = await dio.get(_baseUrl + "filter.php?c=$category");
    if (response.statusCode == 200) {
      return MealsResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
