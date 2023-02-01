import 'package:meals_app/meals/meals.dart';

class MealsRepository {
  List<Meal>? _meals;

  Future<List<Meal>> getMeals() async {
    if (_meals != null) return _meals!;
    return Future.delayed(const Duration(microseconds: 500))
        .then((value) => dummyMeals);
  }
}
