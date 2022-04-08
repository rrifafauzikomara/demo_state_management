abstract class MealsEvent {
  const MealsEvent();
}

class GetSeafood extends MealsEvent {
  final String name;

  const GetSeafood({required this.name});
}
