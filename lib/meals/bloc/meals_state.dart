part of 'meals_bloc.dart';

class MealsState {
  const MealsState({
    this.favouriteMeals = const [],
    this.meals = const [],
    this.filters = const {
      'gluten': false,
      'lactose': false,
      'vegetarian': false,
      'vegan': false
    },
  });

  final List<Meal> favouriteMeals;
  final List<Meal> meals;
  final Map<String, bool> filters;

  MealsState copyWith({
    List<Meal>? favouriteMeals,
    List<Meal>? meals,
    Map<String, bool>? filters,
  }) {
    return MealsState(
      favouriteMeals: favouriteMeals ?? this.favouriteMeals,
      meals: meals ?? this.meals,
      filters: filters ?? this.filters,
    );
  }
}
