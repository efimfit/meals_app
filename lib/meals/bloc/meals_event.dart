part of 'meals_bloc.dart';

abstract class MealsEvent {
  const MealsEvent();
}

class FavouriteMealToogled extends MealsEvent {
  FavouriteMealToogled({required this.mealId});

  final String mealId;
}

class MealsFetched extends MealsEvent {
  const MealsFetched();
}

class FiltersUpdated extends MealsEvent {
  const FiltersUpdated({required this.selectedFilters});

  final Map<String, bool> selectedFilters;
}
