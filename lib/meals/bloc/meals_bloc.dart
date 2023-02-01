import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/meals/models/meal_model.dart';
import 'package:meals_app/meals/repository/meals_repository.dart';

part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc({
    required MealsRepository mealsRepository,
  })  : _mealsRepository = mealsRepository,
        super(const MealsState()) {
    on<FavouriteMealToogled>(_onFavouriteMealToogled);
    on<MealsFetched>(_onMealsFetched);
    on<FiltersUpdated>(_onFiltersUpdated);
  }
  final MealsRepository _mealsRepository;

  FutureOr<void> _onFavouriteMealToogled(
      FavouriteMealToogled event, Emitter<MealsState> emit) {
    final List<Meal> newFavouriteMeals;
    final existingItem =
        state.favouriteMeals.indexWhere((e) => e.id == event.mealId);
    if (existingItem >= 0) {
      newFavouriteMeals = state.favouriteMeals..removeAt(existingItem);
    } else {
      newFavouriteMeals = <Meal>[
        state.meals.firstWhere((e) => e.id == event.mealId)
      ];
    }
    emit(state.copyWith(favouriteMeals: newFavouriteMeals));
  }

  Future<void> _onMealsFetched(
      MealsFetched event, Emitter<MealsState> emit) async {
    final currentMeals = await _mealsRepository.getMeals();
    emit(state.copyWith(meals: currentMeals));
  }

  void _onFiltersUpdated(FiltersUpdated event, Emitter<MealsState> emit) {
    emit(state.copyWith(filters: event.selectedFilters));
  }
}
