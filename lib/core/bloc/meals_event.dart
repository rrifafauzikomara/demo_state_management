abstract class MealsEvent {
  const MealsEvent();
}

class GetSeafood extends MealsEvent {
  final String name;

  const GetSeafood({required this.name});
}

class GetDessert extends MealsEvent {
  final String name;

  const GetDessert({required this.name});
}
