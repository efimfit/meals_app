import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/meals/meals.dart';

class CuisinePage extends StatefulWidget {
  static const routeName = '/category-meals';

  const CuisinePage({super.key});

  @override
  State<CuisinePage> createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> {
  late String _categoryTitle;
  late String _categoryId;
  var _isInitData = false;

  @override
  void didChangeDependencies() {
    if (!_isInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      _categoryId = routeArgs['id'] as String;
      _categoryTitle = routeArgs['title'] as String;
      _isInitData = true;
    }
    super.didChangeDependencies();
  }

  List<Meal> _fetchFilteredMeals(List<Meal> meals, Map<String, bool> filters) {
    final displayedMeals = meals
        .where((e) => e.categories.contains(_categoryId))
        .toList()
        .where((meal) {
      if (filters['gluten'] == true && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose'] == true && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegetarian'] == true && !meal.isVegetarian) {
        return false;
      }
      if (filters['vegan'] == true && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    return displayedMeals;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_categoryTitle)),
      body: BlocBuilder<MealsBloc, MealsState>(
        builder: (context, state) {
          final displayedMeals =
              _fetchFilteredMeals(state.meals, state.filters);
          return ListView.builder(
            itemCount: displayedMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                affordability: displayedMeals[index].affordability,
              );
            },
          );
        },
      ),
    );
  }
}
