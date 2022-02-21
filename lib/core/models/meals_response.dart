class MealsResponse {
  MealsResponse({
    required this.meals,
  });

  final List<MealItem> meals;

  factory MealsResponse.fromJson(Map<String, dynamic> json) => MealsResponse(
        meals:
            List<MealItem>.from(json["meals"].map((x) => MealItem.fromJson(x))),
      );
}

class MealItem {
  MealItem({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  factory MealItem.fromJson(Map<String, dynamic> json) => MealItem(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );
}
